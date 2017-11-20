//
//  LPRefreshView.h
//  ShuaLian
//
//  Created by apple on 16/8/5.
//  Copyright © 2016年 EvanCai. All rights reserved.
//
/**
 *  下拉刷新的动画视图
 */

#import <UIKit/UIKit.h>

@interface LPRefreshView : UIView

/**
 *  设置缩放比例
 *
 *  @param zoomScale 缩放比例
 */
- (void)showZoomScale:(CGFloat)zoomScale;

/**
 *  隐藏视图
 */
- (void)dismiss;

/**
 *  开始加载动画，绘制S
 */
- (void)beginAnimation;

/**
 *  结束加载动画，停止绘制S
 */
- (void)endAnimation;

@end
