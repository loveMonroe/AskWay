//
//  UITableView+AKHeightCache.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKUITableViewCellData;

@interface UITableView (AKHeightCache)

/**
 cell
 */
@property (nonatomic, strong) NSMutableDictionary *cellDic;

/**
 返回cell高度并缓存高度
 
 @param cellData cellData
 @return cell高度
 */
- (CGFloat)lp_calculateCellWithCellData:(AKUITableViewCellData *)cellData;

@end
