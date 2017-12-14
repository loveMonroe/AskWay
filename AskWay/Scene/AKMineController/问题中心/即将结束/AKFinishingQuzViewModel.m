//
//  AKFinishingQuzViewModel.m
//  AskWay
//
//  Created by damion on 2017/12/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKFinishingQuzViewModel.h"

@implementation AKFinishingQuzViewModel

- (void)createDataSource {
    
    AKMyAnswerCellData *cellData1 = [[AKMyAnswerCellData alloc] init];
    cellData1.serialNum = @(123235235235);
    cellData1.resultType = AKQuesResultTypeQuick;
    cellData1.titleString = @"产品经理跨行业的经验要如何积累？产品经理跨行业的经验要如何积累？";
    cellData1.quesType = @"面试指导";
    cellData1.endTime = 29374923749;
    cellData1.moneyNum = @(100);
    cellData1.showSerialNum = NO;
    
    AKMyAnswerCellData *cellData2 = [[AKMyAnswerCellData alloc] init];
    cellData2.serialNum = @(9282372024);
    cellData2.resultType = AKQuesResultTypeQuick;
    cellData2.titleString = @"在Google上海上班是怎样一种体验？";
    cellData2.quesType = @"简历指导";
    cellData2.endTime = 182838238;
    cellData2.moneyNum = @(50);
    cellData2.showSerialNum = NO;
    
    AKMyAnswerCellData *cellData3 = [[AKMyAnswerCellData alloc] init];
    cellData3.serialNum = @(48982379423);
    cellData3.resultType = AKQuesResultTypeQuick;
    cellData3.titleString = @"对刚入职场几年的新人有哪些建议和忠告？";
    cellData3.quesType = @"职业规划";
    cellData3.endTime = 489192638;
    cellData3.moneyNum = @(30);
    cellData3.showSerialNum = NO;
    
    NSArray *section1 = @[cellData1, cellData2, cellData3];
    
    self.mDataArray = @[section1].mutableCopy;
}

@end
