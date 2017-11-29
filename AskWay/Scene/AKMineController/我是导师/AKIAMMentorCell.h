//
//  AKIAMMentorCell.h
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCell.h"

#import "AKUITableViewCellData.h"


@interface AKIAMMentorCellData : AKUITableViewCellData

@property (nonatomic, copy) NSString *nameString;

@property (nonatomic, copy) NSString *jobTitle;

@property (nonatomic, assign) BOOL isAuthed;

@end


@interface AKIAMMentorCell : AKUITableViewCell <AKIAMMentorCellData *>

@end


@interface AKIAMMentorQusCellData : AKUITableViewCellData

@property (nonatomic, retain) NSNumber *qusNumber;

@end

@interface AKIAMMentorQusCell : AKUITableViewCell <AKIAMMentorQusCellData *>

@end
