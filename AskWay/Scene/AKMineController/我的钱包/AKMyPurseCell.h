//
//  AKMyPurseCell.h
//  AskWay
//
//  Created by damion on 2017/12/1.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCell.h"

#import "AKUITableViewCellData.h"

@interface AKMyPurseCellData : AKUITableViewCellData

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) NSNumber *balanceNum;

@property (nonatomic, copy) NSNumber *flowMoneyNum;

@property (nonatomic, copy) NSString *timeString;

@property (nonatomic, assign) BOOL isIncome;

@end

@interface AKMyPurseCell : AKUITableViewCell <AKMyPurseCellData *>

@end
