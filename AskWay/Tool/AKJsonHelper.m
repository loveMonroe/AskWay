//
//  AKJsonHelper.m
//  AskWay
//
//  Created by 郭天际 on 2018/1/6.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "AKJsonHelper.h"

#import <objc/runtime.h>

@implementation NSString (AKJSONDeserializing)
- (id)objectFromJSONString{
    return nil;
}
- (id)mutableObjectFromJSONString{
    return nil;
}
- (id)yr_objectFromJSONString{
    return [AKJsonHelper objectFromJSONString:self];
}
- (id)yr_mutableObjectFromJSONString{
    return [AKJsonHelper mutableObjectFromJSONString:self];
}
@end

@implementation NSData (AKJSONDeserializing)
- (id)objectFromJSONData{
    return nil;
}
- (id)mutableObjectFromJSONData{
    return nil;
}
- (id)yr_objectFromJSONData{
    return [AKJsonHelper objectFromJSONData:self];
}
- (id)yr_mutableObjectFromJSONData{
    return [AKJsonHelper mutableObjectFromJSONData:self];
}
@end


@implementation NSString (AKJSONSerializing)
- (NSData *)JSONData{
    return nil;
}
- (NSString *)JSONString{
    return nil;
}
- (NSData *)yr_JSONData{
    return [AKJsonHelper dataWithObject:self];
}
- (NSString *)yr_JSONString{
    return [AKJsonHelper stringWithObject:self];
}
@end

@implementation NSArray (AKJSONSerializing)
- (NSData *)JSONData{
    return nil;
}
- (NSString *)JSONString{
    return nil;
}
- (NSData *)yr_JSONData{
    return [AKJsonHelper dataWithObject:self];
}
- (NSString *)yr_JSONString{
    return [AKJsonHelper stringWithObject:self];
}
@end

@implementation NSDictionary (AKJSONSerializing)
- (NSData *)JSONData{
    return nil;
}
- (NSString *)JSONString{
    return nil;
}
- (NSData *)yr_JSONData{
    return [AKJsonHelper dataWithObject:self];
}
- (NSString *)yr_JSONString{
    return [AKJsonHelper stringWithObject:self];
}
@end





@implementation AKJsonHelper

+ (void)swizzleInstanceMethodForClass:(Class)class origin:(SEL)origin replace:(SEL)replace{
    Method orignMethod = class_getInstanceMethod(class, origin);
    Method replaceMethod = class_getInstanceMethod(class, replace);
    if (class_addMethod(class, origin, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod))) {
        class_replaceMethod(class, replace, method_getImplementation(orignMethod), method_getTypeEncoding(orignMethod));
    }else{
        method_exchangeImplementations(orignMethod, replaceMethod);
    }
}

+ (void)load{
    [self swizzleInstanceMethodForClass:[NSString class] origin:@selector(objectFromJSONString) replace:@selector(yr_objectFromJSONString)];
    [self swizzleInstanceMethodForClass:[NSString class] origin:@selector(mutableObjectFromJSONString) replace:@selector(yr_mutableObjectFromJSONString)];
    [self swizzleInstanceMethodForClass:[NSData class] origin:@selector(objectFromJSONData) replace:@selector(yr_objectFromJSONData)];
    [self swizzleInstanceMethodForClass:[NSData class] origin:@selector(mutableObjectFromJSONData) replace:@selector(yr_mutableObjectFromJSONData)];
    [self swizzleInstanceMethodForClass:[NSString class] origin:@selector(JSONData) replace:@selector(yr_JSONData)];
    [self swizzleInstanceMethodForClass:[NSString class] origin:@selector(JSONString) replace:@selector(yr_JSONString)];
    [self swizzleInstanceMethodForClass:[NSArray class] origin:@selector(JSONData) replace:@selector(yr_JSONData)];
    [self swizzleInstanceMethodForClass:[NSArray class] origin:@selector(JSONString) replace:@selector(yr_JSONString)];
    [self swizzleInstanceMethodForClass:[NSDictionary class] origin:@selector(JSONData) replace:@selector(yr_JSONData)];
    [self swizzleInstanceMethodForClass:[NSDictionary class] origin:@selector(JSONString) replace:@selector(yr_JSONString)];
}

+ (id)objectFromJSONString:(NSString *)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self objectFromJSONData:data];
}

+ (id)mutableObjectFromJSONString:(NSString *)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    return [self mutableObjectFromJSONData:data];
}

+ (id)objectFromJSONData:(NSData *)data{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

+ (id)mutableObjectFromJSONData:(NSData *)data{
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

+ (NSString *)stringWithObject:(id)object{
    NSString *string = nil;
    NSData *data = [self dataWithObject:object];
    if (data) {
        string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return string;
}

+ (NSData *)dataWithObject:(id)object{
    NSData *data = nil;
    if ([NSJSONSerialization isValidJSONObject:object]) {
        data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        NSLog(@"--->>object %@ not a json object",object);
    }
    return data;
}

+ (NSString *)jsonStringNormalFromObjects:(NSArray *)objects andKeys:(NSArray *)keys {
    if (objects.count == 0 || keys.count == 0 || objects.count != keys.count) {
        return nil;
    }
    [keys enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj = [AKJsonHelper repalceToJsonFormat:obj];
    }];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < objects.count; i ++) {
        [dic setObject:objects[i] forKey:keys[i]];
    }
    return [dic JSONString];
}

+ (NSString *)jsonStringNormalFromValuesAndKeys:(id)object, ...NS_REQUIRES_NIL_TERMINATION {
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
            return nil;
        }
        [valuesArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSString class]]) {
                obj = [AKJsonHelper repalceToJsonFormat:obj];
            }
            else if ([obj isKindOfClass:[NSDictionary class]]) {
                obj = [AKJsonHelper jsonDicNormalFromObject:obj];
            }
        }];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        for (int i = 0; i < valuesArray.count; i ++) {
            [dic setObject:valuesArray[i] forKey:keysArray[i]];
        }
        return [dic JSONString];
    }
    return nil;
}

+ (NSDictionary *)jsonDicNormalFromObject:(id)object {
    if (![object isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:object];
    NSArray *allValues = [dic allValues];
    [allValues enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj = [AKJsonHelper repalceToJsonFormat:obj];
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
