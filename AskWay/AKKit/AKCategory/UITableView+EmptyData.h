//
//  UITableView+EmptyData.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKLoadNoDataView.h"

@interface UITableView (EmptyData)

/**
 空数据提示
 
 @param type 类型
 @param target target
 @param rowCount 数据个数
 */
- (void)tableViewDisplayWithEmptyType:(AKLoadNoDataType)type
                               target:(id)target
               ifNecessaryForRowCount:(NSUInteger)rowCount;

@end
