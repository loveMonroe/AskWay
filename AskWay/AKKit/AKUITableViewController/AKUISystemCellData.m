//
//  AKUISystemCellData.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUISystemCellData.h"

@implementation AKUISystemCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKUISystemCell") class];
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
    self.systemStyle = AKUISystemStyleDefault;
    self.titleFontSize = 15;
    self.titleColor = LPColorTitle;
    self.detailFontSize = 14;
    self.detailColor = LPColorIgnoreTitle;
    self.backgroundColor = LPColorWhite;
}

-(void)setTableViewCellSelectionStyle:(UITableViewCellSelectionStyle)tableViewCellSelectionStyle {
    
    _isCustomSelectionStyle = YES;
    _tableViewCellSelectionStyle = tableViewCellSelectionStyle;
}

@end
