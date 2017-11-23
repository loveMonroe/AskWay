//
//  AKCustomInfoCellData.m
//  AskWay
//
//  Created by damion on 2017/11/23.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKCustomInfoCellData.h"

@implementation AKCustomInfoCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKCustomInfoCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 44.0;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorInset = UIEdgeInsetsMake(0, LPSpaceHorizontalEdge, 0, LPSpaceHorizontalEdge);
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
    _isCustomSelectionStyle = NO;
    self.titleFont = [UIFont systemFontOfSize:15];
    self.titleColor = LPColorTitle;
    self.descFont = [UIFont systemFontOfSize:14];
    self.descColor = LPColorIgnoreTitle;
    self.backgroundColor = LPColorWhite;
}

-(void)setTableViewCellSelectionStyle:(UITableViewCellSelectionStyle)tableViewCellSelectionStyle {
    
    _isCustomSelectionStyle = YES;
    _tableViewCellSelectionStyle = tableViewCellSelectionStyle;
}

@end
