//
//  AKMessageCenterViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMessageCenterViewModel.h"

@implementation AKMessageCenterViewModel


- (void)createDataSource {
    
    AKMessageCenterCellData *cellData1 = [[AKMessageCenterCellData alloc] init];
    cellData1.titleString = @"快问消息";
    cellData1.descString = @"你好，你有新的快问问题更新";
    cellData1.dateString = @"2017/11/30";
    cellData1.isRead = @(0);
    
    AKMessageCenterCellData *cellData2 = [[AKMessageCenterCellData alloc] init];
    cellData2.titleString = @"资金变动提醒";
    cellData2.descString = @"你好，你的资产又增加了15元";
    cellData2.dateString = @"2017/11/30";
    cellData2.isRead = @(1);
    
    AKMessageCenterCellData *cellData3 = [[AKMessageCenterCellData alloc] init];
    cellData3.titleString = @"违规处罚提醒";
    cellData3.descString = @"你好，由于你的回答涉及了敏感词，系统自动对你继续5天禁言";
    cellData3.dateString = @"2017/11/30";
    cellData3.isRead = @(1);
    
    NSArray *section1 = @[cellData1, cellData2, cellData3];
    section1.headerHeight = 24.0;
    
    self.mDataArray = @[section1].mutableCopy;
}

@end
