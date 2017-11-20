//
//  AKLoadNoDataView.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <LPUIKit/LPUIKit.h>

@protocol AKLoadNoDataViewDelegate <NSObject>

@optional
/**
 点击按钮的回调
 */
- (void)loadNoDataViewClickButton:(AKLoadNoDataType)type;

@end

@interface AKLoadNoDataView : LPBaseLoadNoDataView

/**
 代理
 */
@property (nonatomic, weak) id <AKLoadNoDataViewDelegate> delegate;

/**
 显示视图
 
 @param type 类型
 */
- (void)showWithNoDataType:(AKLoadNoDataType)type;

/**
 隐藏视图
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
