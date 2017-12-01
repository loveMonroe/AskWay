//
//  AKMyQuizViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMyQuizViewModel.h"

@implementation AKMyQuizViewModel

- (void)createDataSource {
    
    AKMyQuizCellData *cellData1 = [[AKMyQuizCellData alloc] init];
    cellData1.serialNum = @(123235235235);
    cellData1.resultType = AKQuesResultTypeUndo;
    cellData1.titleString = @"产品经理跨行业的经验要如何积累？产品经理跨行业的经验要如何积累？";
    cellData1.quesType = @"面试指导";
    cellData1.endTime = 29374923749;
    cellData1.moneyNum = @(100);
    
    AKMyQuizCellData *cellData2 = [[AKMyQuizCellData alloc] init];
    cellData2.serialNum = @(9282372024);
    cellData2.resultType = AKQuesResultTypeIng;
    cellData2.titleString = @"在Google上海上班是怎样一种体验？";
    cellData2.quesType = @"简历指导";
    cellData2.endTime = 182838238;
    cellData2.moneyNum = @(50);
    
    AKMyQuizCellData *cellData3 = [[AKMyQuizCellData alloc] init];
    cellData3.serialNum = @(48982379423);
    cellData3.resultType = AKQuesResultTypeFinish;
    cellData3.titleString = @"对刚入职场几年的新人有哪些建议和忠告？";
    cellData3.quesType = @"职业规划";
    cellData3.endTime = 489192638;
    cellData3.moneyNum = @(30);
    
    AKMyQuizCellData *cellData4 = [[AKMyQuizCellData alloc] init];
    cellData4.serialNum = @(123235235235);
    cellData4.resultType = AKQuesResultTypeClosed;
    cellData4.titleString = @"对职场新人来说，试用期有哪些常见坑绝对不能踩？";
    cellData4.quesType = @"专业学习";
    cellData4.endTime = 1661673763;
    cellData4.moneyNum = @(60);
    
    NSArray *section1 = @[cellData1, cellData2, cellData3, cellData4];
    section1.headerHeight = 24.0;
    
    self.mDataArray = @[section1].mutableCopy;
}

@end
