//
//  AKMentorViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMentorViewModel.h"

@implementation AKMentorViewModel

- (void)createDataSource {
    
    AKMentorCellData *cellData1 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData2 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData3 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData4 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData5 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData6 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData7 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData8 = [[AKMentorCellData alloc] init];
    AKMentorCellData *cellData9 = [[AKMentorCellData alloc] init];
    
    NSArray *section1 = @[cellData1, cellData2, cellData3, cellData4, cellData5, cellData6, cellData7, cellData8, cellData9];
    section1.headerHeight = 66.0;
    
    self.mDataArray = @[section1].mutableCopy;
}

@end
