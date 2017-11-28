//
//  AKUITableViewCellData.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKUITableViewCellData : NSObject

/**
 cellData对应的cell类名
 */
@property (nonatomic, assign) Class className;

/**
 cell的重用标记
 */
@property (nonatomic, copy) NSString *cellIdentfier;

/**
 cell的数据源
 */
@property (nonatomic, strong) id cellModel;

/**
 cell的高度，default is 44.0
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 设置cell的间隔样式，default is UITableViewCellSeparatorStyleSingleLine
 */
@property (nonatomic, assign) UITableViewCellSeparatorStyle separatorStyle;

/**
 设置分割线的长度，default left is 16.0，right is 16.0
 */
@property (nonatomic, assign) UIEdgeInsets separatorInset;

/**
 是否显示右箭头，default is NO
 */
@property (nonatomic, assign) BOOL showIndicator;

/**
 箭头距右边距离 默认 12
 */
@property (nonatomic, assign) CGFloat horizontalEdge;

/**
 cell点击方法名
 */
@property (nonatomic, copy) NSString *selectorName;

/**
 扩展
 */
@property (nonatomic, strong) id extend;

/**
 实例化对象
 
 @param className cell的类名
 @param cellIdentfier cell的重用标记
 @return 对象
 */
- (instancetype)initWithCellClassName:(Class)className
                        cellIdentfier:(NSString *)cellIdentfier;

/**
 类方法实例化
 
 @param className cell类名
 @param cellIdentfier cell的重用标记
 @return 对象
 */
+ (instancetype)lp_cellDataWithCellClassName:(Class)className
                               cellIdentfier:(NSString *)cellIdentfier;

@end
