//
//  AKMyAnswerCell.h
//  AskWay
//
//  Created by damion on 2017/12/1.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCell.h"

#import "AKUITableViewCellData.h"


@interface AKMyAnswerCellData : AKUITableViewCellData

@property (nonatomic, copy) NSNumber *serialNum;

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) NSString *quesType;

@property (nonatomic, copy) NSNumber *moneyNum;

@property (nonatomic, assign) NSTimeInterval endTime;

@property (nonatomic, assign) AKQuesResultType resultType;

@property (nonatomic, assign) BOOL showSerialNum;

@end


@interface AKMyAnswerCell : AKUITableViewCell <AKUITableViewCellData *>

@end
