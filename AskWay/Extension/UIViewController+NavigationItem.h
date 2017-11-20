//
//  UIViewController+NavigationItem.h
//  WJSQ
//
//  Created by TYRBL on 16/5/4.
//  Copyright © 2016年 Senro Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LPNavigationBackItemImageName @"icon_nav_arrow"

typedef NS_ENUM(NSInteger, LPItemTinColorStyle) {
    LPItemTinColorStyleWhite = 0,
    LPItemTinColorStyleGray = 1
};


@interface UIViewController (NavigationItem)

/** 返回按钮 箭头的 */
- (void)lp_setupNavBackItemWithAction:(SEL)action;

/** 左边按钮 文字的 */
- (void)lp_setupNavLeftItemWithTitle:(NSString *)title action:(SEL)action;

/** 左边按钮 图片的 */
- (void)lp_setupNavLeftItemWithImage:(NSString *)image action:(SEL)action;

/** 右边按钮 文字的 */
- (void)lp_setupNavRightItemWithTitle:(NSString *)title action:(SEL)action;

/** 右边按钮 图片的 */
- (void)lp_setupNavRightItemWithImage:(NSString *)image action:(SEL)action;


/** 通过自定义button 图片 设置 Right Item */
- (UIButton *)lp_setupNavRightCustomItemWithImage:(NSString *)image action:(SEL)action;

/** 通过自定义button 文字 设置 Right Item */
- (UIButton *)lp_setupNavRightCustomItemWithTitle:(NSString *)title action:(SEL)action;

/** 右边按钮 多个icon 顺序从左往右排  返回button数组 */
- (NSArray<__kindof UIButton *> *)lp_setupNavRightItemsWithImageNames:(NSArray *)imageNames andHandler:(void(^)(NSUInteger itemIndex))block;

/** 右边按钮 文字的 可自定义颜色的*/
- (UIButton *)lp_setupNavRightItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action;



/** 左边 按钮  文字 和 图片 都有的*/
- (UIButton *)lp_setupNavLeftItemWithTitle:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action;



/** 修改 导航栏左边按钮的颜色*/
- (void)lp_changeLeftButtonItemStyle:(LPItemTinColorStyle )style;


/** 修改 导航栏右边 文字按钮的 文字颜色*/
- (void)lp_changeRightButtonItemTitleStyle:(LPItemTinColorStyle )style;



//获取上一个试图控制器的title （当前试图控制器已经在导航控制器的栈中）
- (NSString *)lp_previousViewControllerTitle;

@end








#pragma mark - LPCustomBarButton

typedef NS_ENUM(NSInteger, LPCustomButtonContentMode) {
    LPCustomButtonContentModeNone = 0,
    LPCustomButtonContentModeLeft = 1,
    LPCustomButtonContentModeRight = 2,
    LPCustomButtonContentModeImageLeft = 3,
    LPCustomButtonContentModeImageRight = 4
};

//通过button自定义 item   //这种是有点击效果的  button
@interface LPCustomBarButton : UIButton

@property (assign, nonatomic) LPCustomButtonContentMode customButtonContentMode;


@end

#pragma mark - LPNaviBackButton

//返回 带文字的按钮
@interface LPNaviBackButton : LPCustomBarButton

@end





