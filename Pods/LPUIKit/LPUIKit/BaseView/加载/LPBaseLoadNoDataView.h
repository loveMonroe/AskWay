//
//  LPBaseLoadNoDataView.h
//  LPUIKitDemo
//
//  Created by cs on 2017/2/21.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPBaseLoadNoDataView : UIView

/**
 顶部的图片
 */
@property (nonatomic, strong) UIImageView *topImageView;

/**
 提示label
 */
@property (nonatomic, strong) UILabel *middleLabel;

/**
 底部按钮
 */
@property (nonatomic, strong) UIButton *bottomButton;

/**
 图片、label、底部按钮的父视图
 */
@property (nonatomic, strong) UIView *bgView;

/**
 显示视图

 @param image 图片
 @param labelText 内容
 @param buttonText 按钮上文字
 */
- (void)showImage:(UIImage *)image
        labelText:(NSString *)labelText
       buttonText:(NSString *)buttonText;

/**
 消失视图
 */
- (void)dismiss;

/**
 点击按钮
 */
- (void)noDataButtonClick;

@end
