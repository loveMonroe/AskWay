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
    cellData0.titleFont = SB_font(24);
    cellData0.titleColor = AKColor_Title;
    
    cellData0.cellHeight = 96.0;
    
    AKCustomInfoCellData *cellData1 = [[AKCustomInfoCellData alloc] init];
    cellData1.titleString = @"我的提问";
    cellData1.titleFont = S_font(16);
    cellData1.titleColor = AKColor_Title;
    cellData1.descString = @"2条待处理";
    cellData1.descFont = S_font(14);
    cellData1.descColor = AKColor_Yellow;
    
    cellData1.cellHeight = 64.0;
    
    AKCustomInfoCellData *cellData2 = [[AKCustomInfoCellData alloc] init];
    cellData2.titleString = @"我是导师";
    cellData2.titleFont = S_font(16);
    cellData2.titleColor = AKColor_Title;
    cellData2.descString = @"未认证";
    cellData2.descFont = S_font(14);
    cellData2.descColor = AKColor_IgnoreTitle;
    
    cellData2.cellHeight = 64.0;
    
    AKCustomInfoCellData *cellData3 = [[AKCustomInfoCellData alloc] init];
    cellData3.titleString = @"意见反馈";
    cellData3.titleFont = S_font(16);
    cellData3.titleColor = AKColor_Title;
    
    cellData3.cellHeight = 64.0;
    
    NSArray *section1 = @[cellData0, cellData1, cellData2, cellData3];
    
    self.mDataArray = @[section1].mutableCopy;
    
}

@end
