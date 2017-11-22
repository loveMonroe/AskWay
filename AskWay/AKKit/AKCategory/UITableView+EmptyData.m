//
//  UITableView+EmptyData.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)

- (void)tableViewDisplayWithEmptyType:(AKLoadNoDataType)type
                               target:(id)target
               ifNecessaryForRowCount:(NSUInteger)rowCount {
    if (rowCount > 0) {
        self.backgroundView = nil;
    }else {
        UIView *backView = [UIView new];
        backView.backgroundColor = LPColorBackground;
        self.backgroundView = backView;
        
        AKLoadNoDataView *_loadNoDataView = [[AKLoadNoDataView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, backView.height)];
        _loadNoDataView.delegate = target;
        [backView addSubview:_loadNoDataView];
        [_loadNoDataView showWithNoDataType:type];
    }
}

@end
