//
//  AKTableViewCell.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKUITableViewCellData;

@protocol LPUITableViewCellDelegate <NSObject>

@end

@interface AKUITableViewCell <T : AKUITableViewCellData *> : UITableViewCell

/**
 cell上绑定的数据源
 */
@property (nonatomic,strong) T cellData;

/**
 代理对象为tableView所在的控制器
 */
@property (nonatomic, weak) id delegate;

/**
 配置视图
 */
- (void)configUI;

/**
 绑定数据
 
 @param cellData cellData
 */
- (void)bindData:(AKUITableViewCellData *)cellData;

/**
 计算cell的高度
 
 @param cellData cell配置对象
 @return cell高度
 */
- (CGFloat)getCellHeightWithCellData:(AKUITableViewCellData *)cellData;

/**
 计算cell的高度
 
 @param cellData cell配置对象
 @return cell高度
 */
+ (CGFloat )cellHeightWithCellData:(AKUITableViewCellData *)cellData;

@end
