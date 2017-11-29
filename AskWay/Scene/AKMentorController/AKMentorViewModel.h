//
//  AKMentorViewModel.h
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewModel.h"

#import "AKMentorCell.h"
#import "AKMentorCellData.h"

@interface AKMentorViewModel : AKUITableViewModel

/**
  构造数据源
 */
- (void)createDataSource;

@end
