//
//  AKMyPurseViewModel.m
//  AskWay
//
//  Created by damion on 2017/12/1.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMyPurseViewModel.h"

@implementation AKMyPurseViewModel


- (void)createDataSource {
    
    AKMyPurseCellData *cellData1 = [[AKMyPurseCellData alloc] init];
    cellData1.titleString = @"提问支出（毛莎莎）";
    cellData1.flowMoneyNum = @20.00;
    cellData1.balanceNum = @100.80;
    cellData1.timeString = @"2017/09/05 18:39";
    cellData1.isIncome = NO;
    
    AKMyPurseCellData *cellData2 = [[AKMyPurseCellData alloc] init];
    cellData2.titleString = @"提问充值（微信支付）";
    cellData2.flowMoneyNum = @100.00;
    cellData2.balanceNum = @120.80;
    cellData2.timeString = @"2017/09/05 18:39";
    cellData2.isIncome = YES;
    
    AKMyPurseCellData *cellData3 = [[AKMyPurseCellData alloc] init];
    cellData3.titleString = @"提问充值（微信支付）";
    cellData3.flowMoneyNum = @1.00;
    cellData3.balanceNum = @20.80;
    cellData3.timeString = @"2017/09/05 18:39";
    cellData3.isIncome = YES;
    
    AKMyPurseCellData *cellData4 = [[AKMyPurseCellData alloc] init];
    cellData4.titleString = @"提问支出（杨非正）";
    cellData4.flowMoneyNum = @50.00;
    cellData4.balanceNum = @19.80;
    cellData4.timeString = @"2017/09/05 18:39";
    cellData4.isIncome = NO;
    
    NSArray *section1 = @[cellData1, cellData2, cellData3, cellData4];
    section1.headerHeight = 24;
    
    self.mDataArray = @[section1].mutableCopy;
}

@end
