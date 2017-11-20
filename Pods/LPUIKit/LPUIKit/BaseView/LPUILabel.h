//
//  LPUILabel.h
//  ShuaLian
//
//  Created by cs on 2017/5/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPUILabel : UILabel

typedef enum : NSUInteger {
    LPUILabelTypeTitle = 0,       //标题
    LPUILabelTypeSubTitle = 1,    //次要级信息
    LPUILabelTypeIgnoreTitle = 2, //不重要信息
} LPUILabelType; //label类型

/**
 控制label内容的padding，默认为UIEdgeInsetsZero
 */
@property(nonatomic,assign) UIEdgeInsets contentEdgeInsets;

/**
 是否需要长按复制的功能，默认为 NO
 */
@property(nonatomic,assign) IBInspectable BOOL canPerformCopyAction;

/**
 如果打开了`canPerformCopyAction`，则长按时背景色将会被改为`highlightedBackgroundColor`，default is LPColorBackground
 */
@property(nonatomic,strong) IBInspectable UIColor *highlightedBackgroundColor;

/**
 快速创建一个LPUILabel，等同于
 
 @param frame frame
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             type:(LPUILabelType)type;

/**
 创建label
 
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithType:(LPUILabelType)type;

/**
 创建label
 
 @param frame frame
 @param text 文本
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor;

/**
 创建label
 
 @param frame frame
 @param font 字体大小
 @param textColor 字体颜色
 @param textAlignment 对齐方式
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment;

/**
 创建label
 
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithFont:(UIFont *)font
                       textColor:(UIColor *)textColor;

/**
 创建label
 
 @param font 字体大小
 @param textColor 字体颜色
 @param textAlignment 对齐方式
 @return 对象
 */
+ (instancetype)lp_labelWithFont:(UIFont *)font
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment;

@end
