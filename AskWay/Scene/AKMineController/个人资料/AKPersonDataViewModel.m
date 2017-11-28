//
//  AKPersonDataViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/28.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKPersonDataViewModel.h"

@implementation AKPersonDataViewModel

- (void)createDataSource {
    
    AKUISystemCellData *cellData1 = [[AKUISystemCellData alloc] init];
    cellData1.titleString = @"头像";
    cellData1.titleColor = AKColor_Title;
    cellData1.titleFontSize = 16;
    cellData1.cellHeight = 64.0;
    cellData1.tableViewCellSelectionStyle = UITableViewCellSelectionStyleDefault;
    
    AKUISystemCellData *cellData2 = [[AKUISystemCellData alloc] init];
    cellData2.titleString = @"昵称";
    cellData2.titleColor = AKColor_Title;
    cellData2.titleFontSize = 16;
    cellData2.showIndicator = YES;
    cellData2.detailString = @"叶阳阳";
    cellData2.detailFontSize = 16;
    cellData2.cellHeight = 64.0;
    
    NSArray *section1 = @[cellData1, cellData2];
    section1.headerHeight = 24.0;
    
    self.mDataArray = @[section1].mutableCopy;
    
}

@end
