//
//  AKMentorCellData.h
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCellData.h"

@interface AKMentorCellData : AKUITableViewCellData

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *jobTitle;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, retain) NSArray *jobs;

@property (nonatomic, copy) NSString *headImgUrl;

@end
