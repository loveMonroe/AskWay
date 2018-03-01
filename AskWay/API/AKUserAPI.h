//
//  AKUserAPI.h
//  AskWay
//
//  Created by 郭天际 on 2018/1/6.
//  Copyright © 2018年 sky. All rights reserved.
//

#import "AKRequest.h"

@interface AKUserAPI : AKRequest

- (id)initWithAccount:(NSString *)account andPassword:(NSString *)password;

@end
