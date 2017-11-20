//
//  LPBaseLabel.h
//  LPUIKitDemo
//
//  Created by cs on 2017/2/27.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPBaseLabel : UILabel

typedef enum : NSUInteger {
    LPBaseLabelTypeTitle = 0,       //标题
    LPBaseLabelTypeSubTitle = 1,    //次要级信息
    LPBaseLabelTypeIgnoreTitle = 2, //不重要信息
} LPBaseLabelType; //label类型

/**
 创建label

 @param frame frame
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             type:(LPBaseLabelType)type
                             text:(NSString *)text;

/**
 创建label

 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithType:(LPBaseLabelType)type
                            text:(NSString *)text;

/**
 创建label

 @param frame frame
 @param text 文本
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             text:(NSString *)text
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor;

/**
 创建label

 @param frame frame
 @param text 文本
 @param font 字体大小
 @param textColor 字体颜色
 @param textAlignment 对齐方式
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             text:(NSString *)text
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment;

/**
 创建label
 
 @param text 文本
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithText:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor;

/**
 创建label
 
 @param text 文本
 @param font 字体大小
 @param textColor 字体颜色
 @param textAlignment 对齐方式
 @return 对象
 */
+ (instancetype)lp_labelWithText:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment;

@end
