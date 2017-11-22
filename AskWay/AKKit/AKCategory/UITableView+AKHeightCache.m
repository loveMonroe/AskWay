//
//  UITableView+AKHeightCache.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UITableView+AKHeightCache.h"

#import "AKUITableViewCellData.h"
#import "AKUITableViewCell.h"

#import <objc/runtime.h>

@implementation UITableView (AKHeightCache)

/**
 返回cell高度并缓存高度
 
 @param cellData cellData
 @return cell高度
 */
- (CGFloat)lp_calculateCellWithCellData:(AKUITableViewCellData *)cellData {
    if (cellData.cellHeight > 0) {
        return cellData.cellHeight;
    }
    
    AKUITableViewCell *cell = [self.cellDic objectForKey:cellData.cellIdentfier];
    if (!cell) {
        cell = [[cellData.className alloc] init];
        [self.cellDic setObject:cell forKey:cellData.cellIdentfier];
    }
    return [cell getCellHeightWithCellData:cellData];
}

#pragma mark --- setter、getter---

- (NSMutableDictionary *)cellDic {
    NSMutableDictionary * cellTemp = objc_getAssociatedObject(self, _cmd);
    if (!cellTemp) {
        cellTemp = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, _cmd, cellTemp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return cellTemp;
}

- (void)setCellDic:(NSMutableDictionary *)cellDic {
    objc_setAssociatedObject(self, @selector(cellDic), cellDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
