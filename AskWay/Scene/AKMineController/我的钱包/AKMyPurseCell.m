//
//  AKMyPurseCell.m
//  AskWay
//
//  Created by damion on 2017/12/1.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMyPurseCell.h"

@implementation AKMyPurseCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKMyPurseCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 72.0;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorInset = UIEdgeInsetsMake(0, LPSpaceHorizontalEdge, 0, LPSpaceHorizontalEdge);
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
    self.titleString = @"--";
    self.balanceNum = @0;
    self.flowMoneyNum = @0;
    self.timeString = @"--";
}

@end




@interface AKMyPurseCell ()

@property (nonatomic, retain) LPBaseLabel *titleLabel;

@property (nonatomic, retain) LPBaseLabel *balanceLabel;

@property (nonatomic, retain) LPBaseLabel *flowMoneyLabel;

@property (nonatomic, retain) LPBaseLabel *timeLabel;

@end


@implementation AKMyPurseCell

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (12);
        make.left.mas_equalTo (LPSpaceHorizontalEdge);
        make.height.mas_equalTo (22);
    }];
    
    [self.contentView addSubview:self.flowMoneyLabel];
    [self.flowMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo (weakSelf.titleLabel);
        make.right.mas_equalTo (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (22);
    }];
    
    [self.contentView addSubview:self.balanceLabel];
    [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.titleLabel);
        make.top.equalTo (weakSelf.titleLabel.mas_bottom).offset (12);
        make.height.mas_equalTo (14);
    }];
    
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo (weakSelf.balanceLabel);
        make.right.mas_equalTo (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (14);
    }];
    
}



#pragma mark - Data

- (void)bindData:(AKMyPurseCellData *)cellData {
    [super bindData:cellData];
    
    self.titleLabel.text = cellData.titleString;
    self.balanceLabel.text = [NSString stringWithFormat:@"余额：%@元", cellData.balanceNum];
    self.flowMoneyLabel.text = [NSString stringWithFormat:@"%@%@", cellData.isIncome ? @"+" : @"-", cellData.flowMoneyNum];
    self.timeLabel.text = cellData.timeString;
    
    if (cellData.isIncome) {
        self.flowMoneyLabel.textColor = AKColor_Red;
    } else {
        self.flowMoneyLabel.textColor = AKColor_Title;
    }
}

#pragma mark - Set and Get

- (LPBaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(16) textColor:AKColor_Title];
    }
    return _titleLabel;
}

- (LPBaseLabel *)balanceLabel {
    if (!_balanceLabel) {
        _balanceLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(12) textColor:AKColor_IgnoreTitle];
    }
    return _balanceLabel;
}

- (LPBaseLabel *)flowMoneyLabel {
    if (!_flowMoneyLabel) {
        _flowMoneyLabel = [LPBaseLabel lp_labelWithText:@"" font:SB_font(16) textColor:AKColor_Title];
    }
    return _flowMoneyLabel;
}

- (LPBaseLabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(12) textColor:AKColor_IgnoreTitle];
    }
    return _timeLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
