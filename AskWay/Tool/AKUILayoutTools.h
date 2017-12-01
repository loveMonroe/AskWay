//
//  LPUILayoutTools.h
//  ShuaLian
//
//  Created by 虞谦 on 2017/5/18.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

#define M_font(n) [AKUILayoutTools getMutableFont:n]

@interface AKUILayoutTools : NSObject

/**
 获取字符串合适的Size

 @param string 字符串
 @param font 字体大小
 @param size 最大size
 @return CGSize
 */
+ (CGSize)getStringSize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)size;

/**
 根据字体和宽度返回高度

 @param content 字符串
 @param content_width 最大宽度
 @param font 字体大小
 @return 高度
 */
+ (float)getTxtHeight:(NSString *)content forContentWidth:(float)content_width fotFontSize:(UIFont *)font;

/**
 返回Label能容纳相应text的高度

 @param label label
 @return float
 */
+ (float)getHeight:(UILabel *)label;

/**
 返回Label能容纳相应text的宽度

 @param label label
 @return float
 */
+ (float)getWidth:(UILabel *)label;

/**
 根据字符串及字体大小返回合适的宽度

 @param str 字符串
 @param font 字体大小
 @return 合适的宽度
 */
+ (float)getWidth:(NSString *)str font:(UIFont *)font;

/**
 获取比例宽度

 @param width width
 @return float
 */
+ (float)getScaleWidth:(int)width;

/**
 获取根据屏幕大小调整后的字体大小

 @param font 基础字体大小
 @return UIFont
 */
+ (UIFont *)getMutableFont:(int)font;


@end
