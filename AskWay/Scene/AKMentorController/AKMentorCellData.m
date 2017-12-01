//
//  AKMentorCellData.m
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMentorCellData.h"

@implementation AKMentorCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKMentorCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 0.0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.horizontalEdge = 12;
        [self loadCellDefaultConfig];
    }
    return self;
}

- (instancetype)initWithCellClassName:(Class)className cellIdentfier:(NSString *)cellIdentfier {
    
    if (self = [super initWithCellClassName:className cellIdentfier:cellIdentfier]) {
        
        [self loadCellDefaultConfig];
    }
    return self;
}

- (void)loadCellDefaultConfig {
    
    self.name = @"damion";
    self.jobTitle = @"天师傅集团董事";
    self.desc = @"20年销售经验，深谙各种销售套路";
    self.jobs = @[@"数据采集", @"公司管理", @"理论培训"];
}

@end
