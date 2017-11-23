//
//  AKMineViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/23.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMineViewModel.h"

@implementation AKMineViewModel

- (void)createDataSource {
    
    AKCustomInfoCellData *cellData0 = [[AKCustomInfoCellData alloc] init];
    cellData0.titleString = @"叶阳阳";
    cellData0.titleFont = SB_font(18);
    cellData0.titleColor = LPColorBrand;
    
    cellData0.cellHeight = 120.0;
    
    AKCustomInfoCellData *cellData1 = [[AKCustomInfoCellData alloc] init];
    cellData1.titleString = @"我的提问";
    cellData1.titleFont = S_font(17);
    cellData1.titleColor = LPColorBrand;
    cellData1.descString = @"2条待处理";
    cellData1.descFont = S_font(14);
    cellData1.titleColor = LPColorRead;
    
    cellData1.cellHeight = 88.0;
    
    AKCustomInfoCellData *cellData2 = [[AKCustomInfoCellData alloc] init];
    cellData2.titleString = @"我是导师";
    cellData2.titleFont = S_font(17);
    cellData2.titleColor = LPColorBrand;
    cellData2.descString = @"未认证";
    cellData2.descFont = S_font(14);
    cellData2.titleColor = LPColorRead;
    
    cellData2.cellHeight = 88.0;
    
    AKCustomInfoCellData *cellData3 = [[AKCustomInfoCellData alloc] init];
    cellData3.titleString = @"意见反馈";
    cellData3.titleFont = SB_font(17);
    cellData3.titleColor = LPColorBrand;
    
    cellData3.cellHeight = 88.0;
    
    NSArray *section1 = @[cellData0, cellData1, cellData2, cellData3];
    
    self.mDataArray = @[section1].mutableCopy;
    
}

@end
