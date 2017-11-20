//
//  AKRefreshViewController.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKBaseViewController.h"

#import "AKLoadNoDataView.h"
#import "AKLoadingView.h"

@interface AKRefreshViewController<T:AKViewModel *> : AKBaseViewController <T><AKLoadNoDataViewDelegate>

/**
 *  显示加载视图
 */
- (void)loadingViewShow;

/**
 *  显示加载视图，自定义text
 *
 *  @param text 自定义text，default is 加载中...
 */
- (void)loadingViewShowText:(NSString *)text;

/**
 *  隐藏加载视图
 */
- (void)loadingViewDismiss;

/**
 *  调整加载视图UI
 *
 *  @param top    顶点
 *  @param height 高度
 */
- (void)configLoadingViewTop:(CGFloat)top
height:(CGFloat)height;

/**
 显示无数据视图
 
 @param type 类型
 */
- (void)loadNoDataViewShowType:(AKLoadNoDataType)type;

/**
 隐藏无数据视图
 */
- (void)loadNoDataViewDismiss;

/**
 *  调整无数据视图UI
 *
 *  @param top    顶点
 *  @param height 高度
 */
- (void)configLoadNoDataViewTop:(CGFloat)top
height:(CGFloat)height;

/**
 无数据视图，点击按钮的回调
 
 @param type 类型
 */
- (void)loadNoDataViewClickButton:(AKLoadNoDataType)type;

/**
 获取loadingView(loadingView默认加在了self.view上，如果作为tableView的footerView，可以进行设置)
 
 @return loadingView
 */
- (AKLoadingView *)getLoadingView;

/**
 获取loadNoDataView(loadNoDataView默认加在了self.view上，如果作为tableView的footerView，可以进行设置)
 
 @return loadNoDataView
 */
- (AKLoadNoDataView *)getLoadNoDataView;

@end
