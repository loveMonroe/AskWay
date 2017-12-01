//
//  AKMessageCenterCell.m
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMessageCenterCell.h"

@implementation AKMessageCenterCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKMessageCenterCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 76.0;
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
    self.descString = @"--";
    self.dateString = @"--";
    self.isRead = @(0);
}

@end


@interface AKMessageCenterCell ()

@property (nonatomic, retain) UIImageView *headImgView;

@property (nonatomic, retain) LPBaseLabel *titleLabel;

@property (nonatomic, retain) LPBaseLabel *descLabel;

@property (nonatomic, retain) LPBaseLabel *dateLabel;

@end

@implementation AKMessageCenterCell

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo (weakSelf.contentView).offset (16);
        make.width.height.mas_equalTo (44);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.headImgView.mas_right).offset (14);
        make.top.equalTo (weakSelf.contentView).offset (18);
        make.height.mas_equalTo (16);
    }];
    
    [self.contentView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.titleLabel);
        make.top.equalTo (weakSelf.titleLabel.mas_bottom).offset (11);
        make.height.mas_equalTo (11);
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
    }];
    
    [self.contentView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (12);
        make.centerY.equalTo (weakSelf.titleLabel);
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Data

- (void)bindData:(AKMessageCenterCellData *)cellData {
    [super bindData:cellData];
    
    self.titleLabel.text = cellData.titleString;
    self.descLabel.text = cellData.descString;
    self.dateLabel.text = cellData.dateString;
    
    self.titleLabel.font = !cellData.isRead.boolValue ? SB_font(16) : S_font(16);
    self.descLabel.textColor = !cellData.isRead.boolValue ? AKColor_Title : AKColor_IgnoreTitle;
    self.dateLabel.textColor = !cellData.isRead.boolValue ? AKColor_Blue : AKColor_IgnoreTitle;
}

#pragma mark - Set and Get

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.layer.cornerRadius = 22;
        _headImgView.backgroundColor = LPColorBrand;
    }
    return _headImgView;
}

- (LPBaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [LPBaseLabel lp_labelWithText:@"" font:SB_font(16) textColor:AKColor_Title];
    }
    return _titleLabel;
}

- (LPBaseLabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(14) textColor:AKColor_Title];
    }
    return _descLabel;
}

- (LPBaseLabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(12) textColor:AKColor_Blue];
    }
    return _dateLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
