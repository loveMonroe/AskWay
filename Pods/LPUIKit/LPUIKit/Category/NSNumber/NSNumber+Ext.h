//
//  NSNumber+Ext.h
//  ShuaLian
//
//  Created by gcyang on 16/5/10.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 方法扩展
@interface NSNumber (Ext)

/**
 *  获得日期值,参数标识时间戳是否是毫秒
 *  @param  isMillisecond 数值是否是毫秒
 */
- (NSDate *)dateValue:(BOOL)isMillisecond;
/*
 *  日期yyyy-MM-dd HH:mm:ss格式字符串(时间戳为秒)
 */
- (NSString *)stringDateValue;
/*
 *  日期yyyy-MM-dd HH:mm:ss格式字符串(时间戳为毫秒)
 */
- (NSString *)stringDateForMillisecond;

/*!
 @brief 价格除以100后的字符串(保留2未小数末尾不使用0补齐)
 */
- (NSString *)priceValue;

/**
 时间戳,单位秒
 */
- (NSString *)timeIntervalStringSince1970:(BOOL)millisecond;

@end
