//
//  AKUITableViewCellData.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCellData.h"

@implementation AKUITableViewCellData

- (instancetype)initWithCellClassName:(Class)className cellIdentfier:(NSString *)cellIdentfier {
    self = [super init];
    if (self) {
        _className = className;
        if (cellIdentfier) {
            _cellIdentfier = cellIdentfier;
        }else {
            _cellIdentfier = NSStringFromClass(className);
        }
        _horizontalEdge = LPSpaceHorizontalEdge;
        _cellHeight = 44.0;
        _separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _separatorInset = UIEdgeInsetsMake(0, LPSpaceHorizontalEdge, 0, LPSpaceHorizontalEdge);
    }
    return self;
}

+ (instancetype)lp_cellDataWithCellClassName:(Class)className cellIdentfier:(NSString *)cellIdentfier {
    return [[[self class] alloc] initWithCellClassName:className cellIdentfier:cellIdentfier];
}

@end
