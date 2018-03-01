//
//  LPViewAssistTools.h
//  ShuaLian
//
//  Created by 虞谦 on 2017/5/18.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKViewAssistTools : NSObject


/**
 给view加边框

 @param view 需要加边框的View
 @param color 边框颜色
 @param width 边框线的宽度
 */
+ (void)addBorder:(UIView *)view color:(UIColor *)color width:(float)width;


/**
 删除所有子视图

 @param oneView view
 */
+ (void)removeAllSubView:(UIView *)oneView;


/**
 在view上绘制虚线

 @param lineView 需要绘制成虚线的view
 @param lineLength 虚线的宽度
 @param lineSpacing 虚线的间距
 @param lineColor 虚线的颜色
 */
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineRect:(CGRect)lineRect;

/**
 限制输入框小数点重复输入

 @param textField 当前的textField
 @param range   输入字符替换的range
 @param string  拿来替换的字符
 @param num     小数位
 @return        是否允许输入
 */
+ (BOOL)textField:(UITextField *)textField decimalInputInRange:(NSRange)range replacementString:(NSString *)string decimalNum: (NSInteger)num;

/**
 给Label设置行间距

 @param label 需要设置的label
 @param string label的text
 @param space 需要设置的行间距
 */
+ (void)setSpaceOfLine:(UILabel *)label string:(NSString *)string space:(NSInteger )space;

/**
 TAoverlay show ,加载的时候，可以点击导航栏返回

 @param label string
 */
+ (void)showTAOverlayWithLabel:(NSString *)label;

/**
 TAoverlay show ,加载的时候，导航栏不能点击

 @param label string
 */
+ (void)showTAOverlayNotAllowUserInteractionWithLabel:(NSString *)label;

@end
