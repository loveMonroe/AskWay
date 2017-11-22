//
//  AKTableViewCell.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewCell.h"

#import "AKUITableViewCellData.h"

@interface AKUITableViewCell()

/**
 cell的分割线
 */
@property (nonatomic, strong) UILabel *aSeperateLine;

/**
 cell上的右箭头
 */
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation AKUITableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
        [self.contentView addSubview:self.arrowImageView];
        [self.contentView addSubview:self.aSeperateLine];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_cellData.separatorStyle == UITableViewCellSeparatorStyleNone) {
        self.aSeperateLine.hidden = YES;
    }else {
        self.aSeperateLine.hidden = NO;
        self.aSeperateLine.frame = CGRectMake(self.cellData.separatorInset.left, self.frame.size.height - 1/screenScale , self.frame.size.width - self.cellData.separatorInset.right - self.cellData.separatorInset.left, 1/screenScale);
    }
    
    if (_cellData.showIndicator) {
        self.arrowImageView.hidden = NO;
        self.arrowImageView.frame = CGRectMake(self.frame.size.width - _cellData.horizontalEdge - 10, self.frame.size.height/2 - 8.5, 10, 17);
    }else {
        self.arrowImageView.hidden = YES;
    }
}

#pragma mark - public methods

- (void)configUI {
    
}

- (void)bindData:(AKUITableViewCellData *)cellData {
    _cellData = cellData;
}

- (CGFloat)getCellHeightWithCellData:(AKUITableViewCellData *)cellData {
    if (cellData.cellHeight == 0) {
        [self bindData:cellData];
    }
    
    return cellData.cellHeight;
}

+ (CGFloat )cellHeightWithCellData:(AKUITableViewCellData *)cellData {
    return cellData.cellHeight;
}
#pragma mark - property

- (UILabel *)aSeperateLine {
    if (!_aSeperateLine) {
        _aSeperateLine = [[UILabel alloc] init];
        _aSeperateLine.backgroundColor = LPColorLine;
    }
    return _aSeperateLine;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AKUIKit.bundle/icon_system_list_arrow"]];
    }
    return _arrowImageView;
}

@end
