//
//  AKCustomInfoCellData.h
//  AskWay
//
//  Created by damion on 2017/11/23.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCellData.h"

@interface AKCustomInfoCellData : AKUITableViewCellData

/**
 cell的标题
 */
@property (nonatomic, copy) NSString *titleString;

/**
 cell的描述
 */
@property (nonatomic, copy) NSString *descString;

/**
 cell 右边图片的名字
 */
@property (nonatomic, copy) NSString *rightImageName;

/**
 cell 需要下载的右边图片的名字
 */
@property (nonatomic, copy) NSString *urlImageName;

/**
 cell标题的 文字大小 默认 15
 */
@property (nonatomic, retain) UIFont *titleFont;

/**
 cell描述的 文字大小 默认 14
 */
@property (nonatomic, retain) UIFont *descFont;

/**
 cell标题文字的颜色 默认 #333333
 */
@property (nonatomic, retain) UIColor *titleColor;

/**
 cell描述文字的颜色 默认 #999999
 */
@property (nonatomic, strong) UIColor *descColor;

/**
 cell 的点击效果 默认  显示箭头的 UITableViewCellSelectionStyleDefault
 不显示箭头的是 UITableViewCellSelectionStyleNone
 
 */
@property (nonatomic, assign) UITableViewCellSelectionStyle tableViewCellSelectionStyle;

/**
 是否自定义 选中状态
 */
@property (nonatomic, assign, readonly) BOOL isCustomSelectionStyle;

/**
 设置cell的背景颜色 默认 白色
 */
@property (nonatomic, strong) UIColor *backgroundColor;
/**
 cell 右边图片的大小 默认28*28
 */
@property (nonatomic, assign) CGSize imageSize;

@end
