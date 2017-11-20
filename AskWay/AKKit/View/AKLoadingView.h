//
//  AKLoadingView.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKLoadingView : UIView

/**
 *  显示视图
 */
- (void)show;
/**
 *  显示视图
 *
 *  @param showText 自定义text，default is 加载中
 */
- (void)showText:(NSString *)showText;

/**
 *  隐藏视图
 */
- (void)dismiss;

/**
 *  调整UI
 *
 *  @param top    顶点
 *  @param height 高度
 */
- (void)configureTop:(CGFloat)top
              height:(CGFloat)height;

@end
