//
//  AKIAMMentorViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKIAMMentorViewModel.h"

@implementation AKIAMMentorViewModel

- (void)createDataSource {
    
    AKIAMMentorCellData *cellData1 = [[AKIAMMentorCellData alloc] init];
    cellData1.nameString = @"Damion";
    cellData1.jobTitle = @"天师傅集团董事";
    cellData1.isAuthed = YES;
    cellData1.showIndicator = NO;
    
    AKIAMMentorQusCellData *cellData2 = [[AKIAMMentorQusCellData alloc] init];
    cellData2.qusNumber = @(142);
    cellData2.showIndicator = NO;
    
    AKCustomInfoCellData *cellData3 = [[AKCustomInfoCellData alloc] init];
    cellData3.titleString = @"我的解答";
    cellData3.titleFont = S_font(16);
    cellData3.titleColor = AKColor_Title;
    cellData3.descString = @"2条待处理";
    cellData3.descFont = S_font(14);
    cellData3.descColor = AKColor_Yellow;
    cellData3.cellHeight = 64.0;
    cellData3.tableViewCellSelectionStyle = UITableViewCellSelectionStyleDefault;
    
    AKCustomInfoCellData *cellData4 = [[AKCustomInfoCellData alloc] init];
    cellData4.titleString = @"我的解答";
    cellData4.titleFont = S_font(16);
    cellData4.titleColor = AKColor_Title;
    cellData4.descString = @"128.5元";
    cellData4.descFont = S_font(14);
    cellData4.descColor = AKColor_IgnoreTitle;
    cellData4.cellHeight = 64.0;
    cellData4.tableViewCellSelectionStyle = UITableViewCellSelectionStyleDefault;
    
    NSArray *section1 = @[cellData1, cellData2];
    section1.headerHeight = 12.0;
    section1.footerHeight = 12.0;
    
    NSArray *section2 = @[cellData3, cellData4];
    
    self.mDataArray = @[section1, section2].mutableCopy;
}

@end
