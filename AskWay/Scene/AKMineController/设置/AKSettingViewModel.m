//
//  AKSettingViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKSettingViewModel.h"

@implementation AKSettingViewModel

- (void)createDataSource {
    
    AKUISystemCellData *cellData1 = [[AKUISystemCellData alloc] init];
    cellData1.titleString = @"接收消息";
    cellData1.systemStyle = AKUISystemStyleSwitch;
    cellData1.switchOn = YES;
    cellData1.tableViewCellSelectionStyle = UITableViewCellSelectionStyleNone;
    
    AKUISystemCellData *cellData2 = [[AKUISystemCellData alloc] init];
    cellData2.titleString = @"声音提示";
    cellData2.systemStyle = AKUISystemStyleSwitch;
    cellData2.switchOn = YES;
    cellData2.tableViewCellSelectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *sectionData1 = @[cellData1,cellData2];
    sectionData1.headerHeight = 20.0;
    
    AKUISystemCellData *cellData3 = [[AKUISystemCellData alloc] init];
    cellData3.titleString = @"退出登录";
    cellData3.systemStyle = AKUISystemStyleCenterTitle;
    
    NSArray *sectionData2 = @[cellData3];
    sectionData2.headerHeight = 20.0;
    
    self.mDataArray = @[sectionData1, sectionData2].mutableCopy;
}

@end
