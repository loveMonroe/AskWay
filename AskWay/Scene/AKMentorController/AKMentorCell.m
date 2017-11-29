//
//  AKMentorCell.m
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMentorCell.h"

@interface AKMentorCell ()

@property (nonatomic, retain) UIView *backView;

@property (nonatomic, retain) UIImageView *headImgView;

@property (nonatomic, retain) LPBaseLabel *titleLabel;

@property (nonatomic, retain) LPBaseLabel *jobTitleLabel;

@property (nonatomic, retain) LPBaseLabel *descLabel;

@end

@implementation AKMentorCell

- (void)configUI {
    
    WEAKSELF
    
    [self.contentView addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.contentView).offset (6);
        make.left.equalTo (weakSelf.contentView).offset (LPSpaceHorizontalEdge);
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
        make.bottom.equalTo (weakSelf.contentView).offset (-6);
    }];
    
    [self.backView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo (weakSelf.backView).offset (LPSpaceHorizontalEdge);
        make.width.height.mas_equalTo (44);
    }];
    
    [self.backView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.headImgView.mas_right).offset (12);
        make.top.equalTo (weakSelf.backView).offset (20);
        make.height.mas_equalTo (16);
        make.width.mas_lessThanOrEqualTo (60);
    }];
    
    [self.backView addSubview:self.jobTitleLabel];
    [self.jobTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.titleLabel);
        make.top.equalTo (weakSelf.titleLabel.mas_bottom).offset (8);
        make.height.mas_equalTo (12);
        make.right.equalTo (weakSelf.backView).offset (-LPSpaceHorizontalEdge);
    }];
    
    [self.backView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.headImgView);
        make.top.equalTo (weakSelf.headImgView.mas_bottom).offset (12);
        make.right.equalTo (weakSelf.backView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_lessThanOrEqualTo (80);
    }];
}

#pragma mark - Data

- (void)bindData:(AKMentorCellData *)cellData {
    [super bindData:cellData];
    
    self.titleLabel.text = cellData.name;
    self.jobTitleLabel.text = cellData.jobTitle;
    self.descLabel.text = cellData.desc;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Set and Get

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.layer.cornerRadius = 8;
        _backView.layer.borderWidth = 0.5;
        _backView.layer.masksToBounds = YES;
        _backView.layer.borderColor = HEXACOLOR(0x000000, 0.1).CGColor;
        _backView.clipsToBounds = YES;
    }
    return _backView;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.layer.masksToBounds = YES;
        _headImgView.layer.cornerRadius = 22;
    }
    return _headImgView;
}

- (LPBaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [LPBaseLabel lp_labelWithText:@"" font:SB_font(16) textColor:AKColor_Title];
    }
    return _titleLabel;
}

- (LPBaseLabel *)jobTitleLabel {
    if (!_jobTitleLabel) {
        _jobTitleLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(12) textColor:AKColor_IgnoreTitle];
    }
    return _jobTitleLabel;
}

- (LPBaseLabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(14) textColor:AKColor_Title];
    }
    return _descLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
