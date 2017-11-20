//
//  UIImage+Utility.h
//  XHImageViewer
//
//  Created by 曾 宪华 on 14-2-18.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

+ (UIImage *)fastImageWithData:(NSData *)data;
+ (UIImage *)fastImageWithContentsOfFile:(NSString *)path;

///绘制虚线
+ (UIImage *)drawDashed:(CGRect)rect lineColor:(UIColor *)color;

/**
 * 调整尺寸以适应屏幕显示(根据最大限制尺寸等比例调整)
 *  @param toSize 限制最大尺寸，为0表示不限制
 */
- (CGSize)adjustSize:(CGSize)toSize;

/**
 * 调整尺寸以适应屏幕显示(根据最大限制尺寸等比例调整)
 *  @param size 图片大小
 *  @param toSize 限制最大尺寸，为0表示不限制
 */
+ (CGSize)adjustImage:(CGSize)size toSize:(CGSize)toSize;

/**
 *  通过颜色值创建图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 通过颜色创建图片

 @param color 颜色
 @param size 尺寸
 @return 图片对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 创建圆形图片

 @param raduis 半径
 @return 图片
 */
+ (UIImage *)circleImageWithColor:(UIColor *)color raduis:(CGFloat)raduis;

@end
