//
//  UIViewController+CustomBar.h
//  ShuaLian
//
//  Created by wangshen on 16/11/17.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

//在导航栏隐藏的情况下 显示这个 自定义的 假的导航条

@interface UIViewController (CustomBar)

//bar 默认的 frame （0，0，screenWidth，64）
- (UIView *)lp_addCustomBarWithColor:(UIColor *)color;

/**
 去掉自定义的导航栏
 */
- (void)lp_removeCustomBar;

//设置title
- (UILabel *)lp_setCustomBarTitle:(NSString *)title;

// 添加自定义视图
- (void)lp_addCustomView:(UIView *)view;


//设置 backButton
- (UIButton *)lp_setBackBarButtonWithTitle:(NSString *)title image:(NSString *)image tinColor:(UIColor *)color;

//设置 backButton   带action的
- (UIButton *)lp_setBackBarButtonWithTitle:(NSString *)title  image:(NSString *)image tinColor:(UIColor *)color action:(SEL )action;


//隐藏导航条的情况下设置自定义导航条上的右边的按钮 (文字)
- (UIButton * )lp_setRightBarButtonWithTitle:(NSString *)title tinColor:(UIColor *)color action:(SEL )action;

//隐藏导航条的情况下设置自定义导航条上的右边的按钮 (图片)
- (UIButton * )lp_setRightBarButtonWithImageName:(NSString *)imageName action:(SEL )action;


@end
