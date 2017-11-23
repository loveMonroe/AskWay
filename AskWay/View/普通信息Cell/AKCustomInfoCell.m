//
//  AKCustomInfoCell.m
//  AskWay
//
//  Created by damion on 2017/11/23.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKCustomInfoCell.h"

@interface AKCustomInfoCell ()

@property (nonatomic, retain) LPBaseLabel *titleLabel;

@property (nonatomic, retain) LPBaseLabel *descLabel;

@property (nonatomic, retain) UIImageView *rightImageView;

@end

@implementation AKCustomInfoCell

#pragma mark - UI and Action

- (void)configUI {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descLabel];
    [self.contentView addSubview:self.rightImageView];
}

#pragma mark - data 

- (void)bindData:(AKCustomInfoCellData *)cellData {
    [super bindData:cellData];
    
    self.backgroundColor = cellData.backgroundColor;
    
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.text = cellData.titleString;
    self.titleLabel.textColor = cellData.titleColor;
    self.titleLabel.font = cellData.titleFont;
    
    self.descLabel.textAlignment = NSTextAlignmentLeft;
    self.descLabel.text = cellData.descString;
    self.descLabel.textColor = cellData.descColor;
    self.descLabel.font = cellData.descFont;
    
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    self.rightImageView.image = [UIImage imageNamed:cellData.rightImageName];
    
    if (self.cellData.isCustomSelectionStyle) {
        self.selectionStyle = self.cellData.tableViewCellSelectionStyle;
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    [self.descLabel sizeToFit];
    
    CGFloat titleLeftSpace = LPSpaceHorizontalEdge;
    CGFloat titleLabelWidth = self.titleLabel.width;
    CGFloat titleLabelHeight = self.titleLabel.height;
    self.titleLabel.frame = CGRectMake(titleLeftSpace, (self.height - titleLabelHeight)/2, titleLabelWidth, titleLabelHeight);
    
    CGFloat rightImageWidth = self.rightImageView.image.size.width;
    CGFloat rightImageHeight = self.rightImageView.image.size.height;
    if (rightImageHeight >= self.height) {
        CGFloat rightImageHeight1 = self.height * 4/5;
        rightImageWidth = rightImageHeight1/rightImageHeight * rightImageWidth;
    }
    self.rightImageView.frame = CGRectMake(self.width - LPSpaceHorizontalEdge - rightImageWidth, (self.height - rightImageHeight)/2, rightImageWidth, rightImageHeight);
    
    self.descLabel.left = titleLeftSpace + titleLabelWidth +titleLeftSpace;
    self.descLabel.bottom = self.titleLabel.bottom;
    self.descLabel.width = MIN(self.descLabel.width, self.rightImageView.left - LPSpaceHorizontalEdge - self.descLabel.left);
}

#pragma mark - Setter and Getter

- (LPBaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [LPBaseLabel lp_labelWithType:LPBaseLabelTypeTitle text:@""];
    }
    return _titleLabel;
}

- (LPBaseLabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [LPBaseLabel lp_labelWithType:LPBaseLabelTypeTitle text:@""];
    }
    return _descLabel;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
        _rightImageView.clipsToBounds = YES;
    }
    return _rightImageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
