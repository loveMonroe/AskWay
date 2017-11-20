//
//  UIViewController+KeyBoard.h
//  ShuaLian
//
//  Created by wangshen on 17/3/2.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPKeyBoardObject.h"

//键盘和输入框之间的距离
#define LPTextFieldKeyBoardOffset (45 * (screenWidth/ScreenWidth_4_7) + 59)

@interface UIViewController (KeyBoard) <LPKeyBoardObjectDelegate>


/**
 启用 自动键盘 默认的是 试图控制器的跟视图
 */
- (void)lp_setAutoKeyBoardEnable;


/**
 启用 智能键盘 在某一个视图上 （默认的是 试图控制器的跟视图）
 
 @param view view
 */
- (void)lp_setAutoKeyBoardEnableOnView:(UIView *)view;


//点击空白区域 缩回键盘
- (void)lp_tapSpaceHiddenKeyBoard;

@end
