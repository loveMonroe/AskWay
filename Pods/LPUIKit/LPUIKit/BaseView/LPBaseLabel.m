//
//  LPBaseLabel.m
//  LPUIKitDemo
//
//  Created by cs on 2017/2/27.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import "LPBaseLabel.h"
#import "LPUIMacros.h"

@implementation LPBaseLabel

/**
 创建label
 
 @param frame frame
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             type:(LPBaseLabelType)type
                             text:(NSString *)text {
    UIFont *font;
    UIColor *color;
    switch (type) {
        case LPBaseLabelTypeTitle: {
            font = [UIFont systemFontOfSize:15.0];
            color = LPColorTitle;
        }
            break;
        case LPBaseLabelTypeSubTitle: {
            font = [UIFont systemFontOfSize:14.0];
            color = LPColorSubTitle;
        }
            break;
        case LPBaseLabelTypeIgnoreTitle:{
            font = [UIFont systemFontOfSize:12.0];
            color = LPColorIgnoreTitle;
        }
            break;
        default:
            break;
    }
    
    return [LPBaseLabel lp_labelWithFrame:frame text:text font:font textColor:color textAlignment:NSTextAlignmentLeft];
}

/**
 创建label
 
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithType:(LPBaseLabelType)type
                            text:(NSString *)text {
    return [LPBaseLabel lp_labelWithFrame:CGRectZero type:type text:text];
}

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
                        textColor:(UIColor *)textColor {
    return [LPBaseLabel lp_labelWithFrame:frame text:text font:font textColor:textColor textAlignment:NSTextAlignmentLeft];
}

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
                    textAlignment:(NSTextAlignment)textAlignment {
    LPBaseLabel *label = [[LPBaseLabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

/**
 创建label
 
 @param text 文本
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithText:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor {
    return [LPBaseLabel lp_labelWithFrame:CGRectZero text:text font:font textColor:textColor textAlignment:NSTextAlignmentLeft];

}

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
                   textAlignment:(NSTextAlignment)textAlignment {
    return [LPBaseLabel lp_labelWithFrame:CGRectZero text:text font:font textColor:textColor textAlignment:textAlignment];
}

@end
