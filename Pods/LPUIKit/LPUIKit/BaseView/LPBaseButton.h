//
//  LPBaseButton.h
//  LPUIKitDemo
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+LPUI.h"

typedef enum : NSUInteger {
    LPBaseButtonImportantType       = 0,      //重要按钮，用于页面内重要操作，如登录、确认、付款等（红色背景，白色字体）
    LPBaseButtonNormalType          = 1,      //一般按钮, 用于页面内其他选项操作，次要级的，如取消等(白色背景，红色字体)
    LPBaseButtonToolImportantType   = 2,      //底部工具栏、订单列表中的重要按钮（红色字体，矩形边框）
    LPBaseButtonToolNormalType      = 3,      //底部工具栏、订单列表中的一般按钮（灰色字体，矩形边框）
    LPBaseButtonListImportantType   = 4,      //列表按钮中，重要按钮（红色字体，弧形边框）
    LPBaseButtonListNormalType      = 5,      //列表按钮中，一般按钮（灰色字体，弧形边框）
    LPBaseButtonBottomType          = 6,      //屏幕底部固定按钮（红色背景，白色字体）
    LPBaseButtonGoldenType          = 7,      //特定页面按钮颜色（暗金色）
    LPBaseButtonRedType             = 8,      //红色按钮
} LPBaseButtonType;//按钮类型

@interface LPBaseButton : UIButton

/**
 快速创建LPBaseButton对象

 @param frame frame
 @param type 按钮类型
 @return LPBaseButton对象
 */
+ (LPBaseButton *)lp_buttonWithFrame:(CGRect)frame type:(LPBaseButtonType)type;


/**
 快速创建LPBaseButton对象

 @param type 按钮类型
 @return LPBaseButton对象
 */
+ (LPBaseButton *)lp_buttonWithType:(LPBaseButtonType)type;


@end
