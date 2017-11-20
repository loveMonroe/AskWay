//
//  AKBaseViewController.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKViewModel.h"

@interface AKBaseViewController<T:AKViewModel *> : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

/**
 *  是否Push了视图控制器
 */
@property (nonatomic, assign) BOOL didViewControllerPushed;

@property (nonatomic, retain) T viewModel;

@property (nonatomic, assign) NSInteger pageViewTime;
@property (nonatomic, assign) CFAbsoluteTime pageStartTime;
@property (nonatomic, assign) CFAbsoluteTime pageEndTime;

/// 通过视图模型初始化视图控制器
- (instancetype)initWithViewModel:(T)viewModel;

/// 初始化视图
- (void)initView;

/// 获取视图数据
- (void)fetchViewData:(AKDataLoadType)loadType;

/// 对象将要释放时调用[导航控制器中处理]
- (void)viewWillRelease;

/// 响应来自subviews调用
- (void(^)(id,NSUInteger))performBlock;

/// 导航返回按钮
- (UIBarButtonItem *)backBarButtonItem;

/// 左边导航按钮
- (UIBarButtonItem *)leftBarButtonItem;

/// 右边导航按钮
- (UIBarButtonItem *)rightBarButtonItem;

/// 重写的Push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 直接通过方法名来执行方法
 @param selectorName 方法名字符串
 */
- (void)performSelectorWithName:(NSString *)selectorName;

@end
