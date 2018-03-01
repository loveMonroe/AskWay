//
//  AKUserAPI.m
//  AskWay
//
//  Created by 郭天际 on 2018/1/6.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "AKUserAPI.h"

@implementation AKUserAPI {
    NSString *_account;
    NSString *_password;
}

- (id)initWithAccount:(NSString *)account andPassword:(NSString *)password {
    self = [super init];
    if (self) {
        _account = account;
        _password = password;
    }
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSString *)requestUrl {
    return @"/test/hello.json?token=0bbc72991513257216262757152705&bizType=getMobile";
}

- (id)requestArgument {
    
    return nil;
    
    return @{@"token": @"0bbc72991513257216262757152705", @"bizType": @"getMobile"};
    
    NSMutableDictionary *originDic = [[NSMutableDictionary alloc] initWithDictionary:[super requestArgument]];
    
    NSString *argumentString = [self rsaStringFromValuesAndKeys:_account, @"username", _password, @"password", nil];
    
    [originDic setObject:argumentString forKey:@"data"];
    
    return originDic;
}

@end
