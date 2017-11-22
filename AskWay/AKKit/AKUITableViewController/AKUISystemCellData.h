//
//  AKUISystemCellData.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCellData.h"

typedef NS_ENUM(NSInteger, AKUISystemStyle) {
    AKUISystemStyleDefault = 0,  //默认的类型 左边是头像 （如果不设置 就会隐藏）  title 右边是描述（如果不设置就不显示） 还有向右箭头（可隐藏）
    AKUISystemStyleSwitch = 1,  //带有开关的 cell   右边会有一个开关 （默认箭头隐藏的）
    AKUISystemStyleImage = 2,   //右边显示小图标的cell
    AKUISystemStyleCenterTitle = 3, //标题在正中间 （例如  退出登录按钮）
    AKUISystemStyleWebImage = 4,  //右边显示小图标的cell（需下载）
};

@interface AKUISystemCellData : AKUITableViewCellData

/**
 cell 的类型  默认是 LPSystemStyleDefault
 */
@property (nonatomic, assign) AKUISystemStyle systemStyle;
/**
 cell的标题
 */
@property (nonatomic, copy) NSString *titleString;

/**
 cell的简介
 */
@property (nonatomic, copy) NSString *detailString;

/**
 cell左边图标的名字
 */
@property (nonatomic, copy) NSString *imageName;

/**
 开关是否开启 （默认NO）
 */
@property (nonatomic, assign) BOOL switchOn;

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
@property (nonatomic, assign) CGFloat titleFontSize;

/**
 cell描述的 文字大小 默认 14
 */
@property (nonatomic, assign) CGFloat detailFontSize;

/**
 cell标题文字的颜色 默认 #333333
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 cell描述文字的颜色 默认 #999999
 */
@property (nonatomic, strong) UIColor *detailColor;

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

/**
 cell 左边图片的大小 默认24*24
 */
@property (nonatomic, assign) CGSize leftImageSize;

@end
