//
//  AKMessageCenterCell.h
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCell.h"

#import "AKUITableViewCellData.h"

@interface AKMessageCenterCellData : AKUITableViewCellData

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, copy) NSString *descString;

@property (nonatomic, copy) NSString *dateString;

@property (nonatomic, copy) NSString *headImgName;

@property (nonatomic, copy) NSNumber *isRead;

@end

@interface AKMessageCenterCell : AKUITableViewCell <AKMessageCenterCellData *>

@end
