//
//  NSString+Device.h
//  LPUIKitDemo
//
//  Created by cs on 2017/2/9.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Device)

/**
 获取设备名称

 @return 设备名称
 */
+ (NSString *)deviceVersion;

/**
 获取手机系统版本

 @return 系统版本
 */
+ (NSString *)systemVersion;

@end
