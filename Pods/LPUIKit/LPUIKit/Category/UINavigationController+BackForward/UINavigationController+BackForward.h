//
//  UINavigationController+BackForward.h
//  ShuaLian
//
//  Created by wangshen on 2017/7/4.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (BackForward)


/**
  返回到指定的控制器

 @param aClassName 指定控制器的类名
 @param animated 是否使用动画
 */
- (void)lp_popToViewControllerWithClassName:(NSString *)aClassName animated:(BOOL )animated;


/**
 push新的视图控制器 并关闭掉当前的页面

 @param viewContoller 将要push的控制器
 @param animated 是否使用动画
 */
- (void)lp_pushViewControllerWithCloseCurrent:(UIViewController *)viewContoller animated:(BOOL )animated;

@end

