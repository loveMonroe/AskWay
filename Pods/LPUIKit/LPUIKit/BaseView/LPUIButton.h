//
//  LPUIButton.h
//  ShuaLian
//
//  Created by cs on 2017/5/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LPUIButtonImportantType = 0,      //重要按钮，用于页面内重要操作，如登录
} LPUIButtonType; //按钮类型

@class LPUIButton;
typedef void(^LPUIButtonClickBlock)();

@interface LPUIButton : UIButton

/**
 点击热区，default is button的width和height
 */
@property (nonatomic, assign) CGSize hotSize;

/**
 点击的回调
 */
@property (nonatomic, copy) LPUIButtonClickBlock buttonClickBlock;

/**
 快速创建LPUIButton对象
 
 @param frame frame
 @param type 按钮类型
 @param title 标题
 @return LPUIButton对象
 */
+ (instancetype)lp_buttonWithFrame:(CGRect)frame type:(LPUIButtonType)type title:(NSString *)title;


/**
 快速创建LPUIButton对象
 
 @param type 按钮类型
 @param title 标题
 @return LPUIButton对象
 */
+ (instancetype)lp_buttonWithType:(LPUIButtonType)type title:(NSString *)title;

@end


/**
 *  支持显示下划线的按钮，可用于需要链接的场景。下划线默认和按钮宽度一样，可通过 `underlineInsets` 调整。
 */
@interface LPUILinkButton : LPUIButton

/**
 控制下划线隐藏或显示，默认为NO，也即显示下划线
 */
@property(nonatomic, assign) IBInspectable BOOL underlineHidden;

/**
 设置下划线的宽度，默认为 1
 */
@property(nonatomic, assign) IBInspectable CGFloat underlineWidth;

/**
 控制下划线颜色，若设置为nil，则使用当前按钮的titleColor的颜色作为下划线的颜色。默认为 nil
 */
@property(nonatomic, strong) IBInspectable UIColor *underlineColor;

/**
 下划线的位置是基于 titleLabel 的位置来计算的，默认x、width均和titleLabel一致，而可以通过这个属性来调整下划线的偏移值。默认为UIEdgeInsetsZero
 */
@property(nonatomic, assign) UIEdgeInsets underlineInsets;

@end


