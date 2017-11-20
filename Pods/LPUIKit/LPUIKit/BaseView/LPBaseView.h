//
//  LPBaseView.h
//  LPUIKitDemo
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPUIMacros.h"

@interface LPBaseView<T> : UIView

/**
 *  关联数据
 */
@property (nonatomic, strong) T objectValue;

/**
 快速创建LPBaseView对象
 
 @param frame frame
 @param backgroundColor 背景色
 @return LPBaseView对象
 */
+ (LPBaseView *)lp_viewWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor;

/**
 快速创建LPBaseView对象
 
 @param backgroundColor 背景色
 @return LPBaseView对象
 */
+ (LPBaseView *)lp_viewWithBackgroundColor:(UIColor *)backgroundColor;

/**
 配置UI
 */
- (void)configUI;

/**
 绑定数据

 @param object 数据对象
 */
- (void)bindData:(T)object;

/**
 设置圆角

 @param cornerRadius 圆角半径
 */
- (void)makeCorner:(CGFloat)cornerRadius;

@end
