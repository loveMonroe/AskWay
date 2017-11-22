//
//  AKUISystemCell.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCell.h"

#import "AKUISystemCellData.h"

@class AKUISystemCell;

@protocol LPUISystemCellDelegate <LPUITableViewCellDelegate>

@optional

- (void)systemCell:(AKUISystemCell *)systemCell switchOn:(BOOL)switchOn willSwitchBlock:(void(^)(BOOL switchOn))block;

- (void)systemCell:(AKUISystemCell *)systemCell switchOn:(BOOL)switchOn;

@end

@interface AKUISystemCell : AKUITableViewCell <AKUISystemCellData *>

@end
