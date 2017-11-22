//
//  AKUISystemCell.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUISystemCell.h"

@interface AKUISystemCell ()

/**
 开关
 */
@property (nonatomic, strong) UISwitch *aSwitch;
@property (nonatomic, strong) UIView *switchView;

/**
 显示在右边的图标
 */
@property (nonatomic, strong) UIImageView *aRightImageView;

@end

@implementation AKUISystemCell

- (void)configUI {
    [self.contentView addSubview:self.aRightImageView];
}

- (void)bindData:(AKUISystemCellData *)cellData {
    [super bindData:cellData];
    self.backgroundColor = cellData.backgroundColor;
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.text = cellData.titleString;
    self.textLabel.textColor = cellData.titleColor;
    self.textLabel.font = [UIFont systemFontOfSize:cellData.titleFontSize];
    self.detailTextLabel.text = cellData.detailString;
    self.detailTextLabel.textColor = cellData.detailColor;
    self.detailTextLabel.font = [UIFont systemFontOfSize:cellData.detailFontSize];
    
    NSString *imageName = cellData.imageName;
    if (imageName && imageName.length) {
        self.imageView.image = [UIImage imageNamed:imageName];
    }else {
        self.imageView.image = nil;
    }
    
    if (cellData.showIndicator) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    self.aSwitch.hidden = YES;
    self.aRightImageView.hidden = YES;
    if (cellData.systemStyle == AKUISystemStyleSwitch) {
        self.aSwitch.hidden = NO;
        self.aSwitch.on = cellData.switchOn;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if (cellData.systemStyle == AKUISystemStyleImage) {
        self.aRightImageView.hidden = NO;
        NSString *rightName = cellData.rightImageName;
        if (rightName && rightName.length) {
            self.aRightImageView.image = [UIImage imageNamed:rightName];
        }else {
            self.aRightImageView.image = nil;
        }
        
    }else if (cellData.systemStyle == AKUISystemStyleWebImage) {
        self.aRightImageView.hidden = NO;
        if (cellData.extend) {
            self.aRightImageView.image = (UIImage *)cellData.extend;
        }else if (![NSString isBlankString:cellData.urlImageName]) {
            NSString *imageUrlString = cellData.urlImageName;
            [self.aRightImageView sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:[UIImage imageNamed:cellData.rightImageName]];
        }else {
            self.aRightImageView.image = [UIImage imageNamed:cellData.rightImageName];
        }
    }else if(cellData.systemStyle == AKUISystemStyleCenterTitle){
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }else {
        
    }
    
    if (self.cellData.isCustomSelectionStyle) {
        self.selectionStyle = self.cellData.tableViewCellSelectionStyle;
    }
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self.textLabel sizeToFit];
    [self.detailTextLabel sizeToFit];
    //    self.detailTextLabel.backgroundColor = [UIColor orangeColor];
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    CGFloat titleLabelWidth = self.textLabel.width;
    CGFloat titleLabelHeight = self.textLabel.height;
    CGFloat titleSpace = 12;
    if (imageWidth == 0) {
        titleSpace = 0;
    }
    
    CGFloat detailLabelMaxRight = self.width - LPSpaceHorizontalEdge;
    if (self.cellData.showIndicator) {
        detailLabelMaxRight = self.width - 30;
    }
    
    if (self.cellData.leftImageSize.width != 0) {
        imageWidth = self.cellData.leftImageSize.width;
        imageHeight = self.cellData.leftImageSize.height;
    }
    
    self.imageView.frame = CGRectMake(LPSpaceHorizontalEdge, (self.height - imageHeight)/2, imageWidth, imageHeight);
    if (self.cellData.detailString.length == 0 || !self.cellData.detailString) {
        if (self.imageView.right + titleSpace + titleLabelWidth >= self.width) {
            if (self.cellData.showIndicator) {
                titleLabelWidth = self.width - self.imageView.right - titleSpace - 30;
            }else {
                titleLabelWidth = self.width - self.imageView.right - titleSpace - LPSpaceHorizontalEdge;
            }
        }
    }else {
        if (self.imageView.right + titleSpace + titleLabelWidth >= self.width/2) {
            titleLabelWidth = self.width/2 - self.imageView.right - titleSpace;
        }
    }
    self.textLabel.frame = CGRectMake(self.imageView.right + titleSpace, (self.height - titleLabelHeight)/2, titleLabelWidth, titleLabelHeight);
    
    
    if (self.cellData.systemStyle == AKUISystemStyleSwitch) {
        self.switchView.frame = CGRectMake(detailLabelMaxRight - 51, (self.height - 30)/2, 51, 31);
    }else if (self.cellData.systemStyle == AKUISystemStyleImage) {
        CGFloat rightImageWidth = self.aRightImageView.image.size.width;
        CGFloat rightImageHeight = self.aRightImageView.image.size.height;
        
        if (rightImageHeight >= self.height) {
            rightImageHeight = self.height * 4/5;
            rightImageWidth = rightImageHeight/self.aRightImageView.image.size.height * rightImageWidth;
        }
        self.aRightImageView.frame = CGRectMake(detailLabelMaxRight - rightImageWidth, (self.height - rightImageHeight)/2, rightImageWidth, rightImageHeight);
    }else if (self.cellData.systemStyle == AKUISystemStyleCenterTitle) {
        self.textLabel.frame = CGRectMake(LPSpaceHorizontalEdge, (self.height - titleLabelHeight)/2, self.width - LPSpaceHorizontalEdge * 2, titleLabelHeight);
    }else if (self.cellData.systemStyle == AKUISystemStyleWebImage) {
        self.aRightImageView.frame = CGRectMake(detailLabelMaxRight-28, (self.height-28)/2, 28, 28);
    }else {
        CGFloat detailLabelWidth = self.detailTextLabel.width;
        CGFloat detailLabelHeight = self.detailTextLabel.height;
        CGFloat detailLabelLeft = detailLabelMaxRight - detailLabelWidth;
        if (detailLabelLeft < self.textLabel.right + 10) {
            detailLabelLeft = self.textLabel.right + 10;
        }
        self.detailTextLabel.frame = CGRectMake(detailLabelLeft, (self.height - detailLabelHeight)/2,detailLabelMaxRight - detailLabelLeft, detailLabelHeight);
        
    }
    
}

#pragma mark - Action
- (void)switchAction:(UISwitch *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(systemCell:switchOn:)]) {
        [self.delegate systemCell:self switchOn:sender.on];
    }
}

- (void)tapSwitchView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(systemCell:switchOn:willSwitchBlock:)]) {
        [self.delegate systemCell:self switchOn:_aSwitch.on willSwitchBlock:^(BOOL switchOn) {
            self.cellData.switchOn = switchOn;
            [_aSwitch setOn:switchOn animated:YES];
            [self switchAction:_aSwitch];
        }];
    }else {
        self.cellData.switchOn = !_aSwitch.on;
        [_aSwitch setOn:!_aSwitch.on animated:YES];
        [self switchAction:_aSwitch];
    }
}

#pragma mark - getter
- (UISwitch *)aSwitch {
    if (!_aSwitch) {
        _aSwitch = [[UISwitch alloc] init];
        _aSwitch.userInteractionEnabled = NO;
        [self.switchView addSubview:_aSwitch];
    }
    return _aSwitch;
}

- (UIView *)switchView {
    if (!_switchView) {
        _switchView = [AKToolCreateUI createUIView:CGRectZero backgroundColor:nil superView:self.contentView];
        _switchView.ges_tap(self, @selector(tapSwitchView));
    }
    return _switchView;
}

- (UIImageView *)aRightImageView {
    
    if (!_aRightImageView) {
        _aRightImageView = [[UIImageView alloc] init];
        _aRightImageView.contentMode = UIViewContentModeScaleAspectFill;
        _aRightImageView.clipsToBounds = YES;
//        _aRightImageView.isThumbnail = YES;
    }
    return _aRightImageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
