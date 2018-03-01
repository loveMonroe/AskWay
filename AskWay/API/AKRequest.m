//
//  AKRequest.m
//  AskWay
//
//  Created by 郭天际 on 2018/1/6.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "AKRequest.h"

#import "AKViewAssistTools.h"
#import "AKRSA.h"

@interface AKRequest ()

@property (nonatomic, strong, readwrite, nullable) NSDictionary *akResponseData;

@property (nonatomic, readwrite) NSInteger akResponseCode;

@property (nonatomic, strong, readwrite, nullable) NSError *akResponseError;
///json->model
@property (nonatomic, assign) BOOL modelTransform;

@end

@implementation AKRequest

- (void)startWithDataCompletionBlockWithSuccess:(AKRequestSuccessCompletionBlock)success
                                        failure:(AKRequestFailureCompletionBlock)failure
{
    [self setDataCompletionBlockWithSuccess:success failure:failure];
    [self startRequest];
}

- (void)setDataCompletionBlockWithSuccess:(AKRequestSuccessCompletionBlock)success
                                  failure:(AKRequestFailureCompletionBlock)failure
{
    self.successDataCompletionBlock = success;
    self.failureDataCompletionBlock = failure;
}

- (void)setJsonModelName:(NSString *)jsonModelName {
    if (jsonModelName && jsonModelName.length > 0) {
        _jsonModelName = jsonModelName;
        _modelTransform = YES;
    }
    else {
        _modelTransform = NO;
    }
}

- (void)startRequest {
    
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        //解析数据
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

#pragma mark - Set and Get


#pragma mark - 覆盖父类的方法
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (NSTimeInterval)requestTimeoutInterval {
    return 20;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (void)clearCompletionBlock {
    // nil out to break the retain cycle.
    self.successDataCompletionBlock = nil;
    self.failureDataCompletionBlock = nil;
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (id)requestArgument {
    NSMutableString *currentVersion = [NSMutableString stringWithString:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    [currentVersion replaceOccurrencesOfString:@"." withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, currentVersion.length)];
    
    return @{@"device": @(2), @"versionCode": [NSNumber numberWithInteger:1]};
}

#pragma mark - 实例方法
- (void)showAnimatedView:(NSString *)text {
    if ([text isEqualToString:@""]) {
        text = nil;
    }
    [AKViewAssistTools showTAOverlayWithLabel:text];
}

- (void)showAnimatedView:(NSString *)text allowInteraction:(BOOL)allowInteraction {
    if (allowInteraction) {
        [AKViewAssistTools showTAOverlayWithLabel:text];
    }else {
        [AKViewAssistTools showTAOverlayNotAllowUserInteractionWithLabel:text];
    }
}

#pragma mark - 参数加密
#pragma mark java
- (NSString *)rsaStringFromValuesAndKeys:(id)object, ...NS_REQUIRES_NIL_TERMINATION {
    
    NSMutableArray *argsArray = [[NSMutableArray alloc] init];
    va_list params; //定义一个指向个数可变的参数列表指针;
    va_start(params, object);//va_start 得到第一个可变参数地址,
    id arg;
    if (object) {
        //将第一个参数添加到array
        id prev = object;
        [argsArray addObject:prev];
        //va_arg 指向下一个参数地址
        //这里是问题的所在 网上的例子，没有保存第一个参数地址，后边循环，指针将不会在指向第一个参数
        while( (arg = va_arg(params,id)) )
        {
            if ( arg ){
                [argsArray addObject:arg];
            }
        }
        //置空
        va_end(params);
        
        NSMutableArray *keysArray = [[NSMutableArray alloc]init];
        NSMutableArray *valuesArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < argsArray.count; i ++) {
            if (i%2) {
                [keysArray addObject:argsArray[i]];
            }
            else {
                [valuesArray addObject:argsArray[i]];
            }
        }
        if (valuesArray.count == 0 || keysArray.count == 0 || valuesArray.count != keysArray.count) {
            return @"";
        }
        [valuesArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSString class]]) {
                obj = [AKRequest repalceToJsonFormat:obj];
            }
            else if ([obj isKindOfClass:[NSDictionary class]]) {
                obj = [AKRequest jsonDicNormalFromObject:obj];
            }
        }];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        for (int i = 0; i < valuesArray.count; i ++) {
            [dic setObject:valuesArray[i] forKey:keysArray[i]];
        }
        
        NSString *jsonString = [dic JSONString];
        NSString *encryptString = [AKRSA RSAEncryptString:jsonString APIType:AKAPITypeJAVA];
        if (encryptString == nil) {
            encryptString = @"";
        }
        
        return encryptString;
    }
    
    return @"";
}

- (NSString *)rsaStringFromValidDic:(NSDictionary *)dic {
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            obj = [AKRequest repalceToJsonFormat:obj];
        }
        else if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = [AKRequest jsonDicNormalFromObject:obj];
        }
        
        if ([key isKindOfClass:[NSString class]]) {
            key = [AKRequest repalceToJsonFormat:key];
        }
        else if ([key isKindOfClass:[NSDictionary class]]) {
            key = [AKRequest jsonDicNormalFromObject:key];
        }
    }];
    
    NSString *jsonString = [dic JSONString];
    NSString *encryptString = [AKRSA RSAEncryptString:jsonString APIType:AKAPITypeJAVA];
    if (encryptString == nil) {
        encryptString = @"";
    }
    
    return encryptString;
}


+ (NSDictionary *)jsonDicNormalFromObject:(id)object {
    if (![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:object];
    NSArray *allValues = [dic allValues];
    [allValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            obj = [AKRequest repalceToJsonFormat:obj];
        }
    }];
    return dic;
}

+ (NSString *)repalceToJsonFormat:(NSString *)originString {
    NSMutableString *s = [NSMutableString stringWithString:originString];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}

@end
