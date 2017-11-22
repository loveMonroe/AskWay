//
//  AKNetworkService.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAKNetworkStatusNotification @"kAKNetworkStatusNotification"    //网络环境变化的通知

@interface AKNetworkService : NSObject

+ (instancetype)sharedInstance;

- (void)startMonitoring;
- (void)stopMonitoring;

/**
 网络是否可用

 @return boolValue
 */
+ (BOOL)isNetworkReachability;

/**
 当前是否连接WiFi

 @return boolValue
 */
+ (BOOL)isWiFi;

/**
 获取IP地址

 @param address 域名地址
 @return IP地址数组
 */
+ (NSArray *)getIPFromAddress:(NSString *)address;

@end
