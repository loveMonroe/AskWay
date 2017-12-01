//
//  AKMyQuizCell.m
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMyQuizCell.h"


@implementation AKMyQuizCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKMyQuizCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 0.0;
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
    self.serialNum = @(201474854785);
    self.titleString = @"--";
    self.endTime = 12394028394;
    self.moneyNum = @100;
    self.quesType = @"面试指导";
    self.resultType = AKQuesResultTypeUndo;
}

@end


@interface AKMyQuizCell ()

@property (nonatomic, retain) LPBaseLabel *serialLabel;

@property (nonatomic, retain) LPBaseLabel *titleLabel;

@property (nonatomic, retain) UIImageView *headImgView;

@property (nonatomic, retain) LPBaseLabel *resultLabel;

@property (nonatomic, retain) UIButton *quesTypeBtn;

@property (nonatomic, retain) LPBaseLabel *timeLabel;

@property (nonatomic, retain) LPBaseLabel *moneyLabel;

@end


@implementation AKMyQuizCell

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    
    [self.contentView addSubview:self.serialLabel];
    [self.serialLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.contentView).offset (LPSpaceHorizontalEdge);
        make.left.equalTo (weakSelf.contentView).offset (LPSpaceHorizontalEdge);
        make.height.mas_equalTo (14);
    }];
    
    [self.contentView addSubview:self.resultLabel];
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo (weakSelf.serialLabel);
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (14);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.serialLabel.mas_bottom).offset (12);
        make.left.equalTo (weakSelf.contentView).offset (LPSpaceHorizontalEdge);
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
    }];
    
    [self.contentView addSubview:self.quesTypeBtn];
    [self.quesTypeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.titleLabel.mas_bottom).offset (12);
        make.left.equalTo (weakSelf.contentView).offset (LPSpaceHorizontalEdge);
        make.height.mas_equalTo (16);
    }];
    
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.quesTypeBtn.mas_right).offset (12);
        make.centerY.equalTo (weakSelf.quesTypeBtn);
        make.height.mas_equalTo (14);
    }];
    
    [self.contentView addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
        make.centerY.equalTo (weakSelf.timeLabel);
        make.height.mas_equalTo (16);
        make.bottom.equalTo (weakSelf.contentView.mas_bottom).offset (-12);
    }];
    
}



#pragma mark - Data

- (void)bindData:(AKMyQuizCellData *)cellData {
    [super bindData:cellData];
    
    self.serialLabel.text = [NSString stringWithFormat:@"编号：%@", cellData.serialNum];
    switch (cellData.resultType) {
        case AKQuesResultTypeUndo: {
            self.resultLabel.text = @"待解答";
            break;
        }
        case AKQuesResultTypeIng: {
            self.resultLabel.text = @"解答中";
            break;
        }
        case AKQuesResultTypeFinish: {
            self.resultLabel.text = @"已完成";
            break;
        }
        case AKQuesResultTypeClosed: {
            self.resultLabel.text = @"已关闭";
            break;
        }
        default: {
            self.resultLabel.text = @"待解答";
            break;
        }
    }
    
    self.titleLabel.text = cellData.titleString;
    [self.quesTypeBtn setTitle:cellData.quesType forState:UIControlStateNormal];
    self.timeLabel.text = [NSString stringWithFormat:@"%f后结束", cellData.endTime];
    self.timeLabel.hidden = cellData.resultType != AKQuesResultTypeUndo;
    self.moneyLabel.text = [NSString stringWithFormat:@"￥%@", cellData.moneyNum];
    
    if (!cellData.cellHeight) {
        CGFloat titleLabelHeight = [AKUILayoutTools getTxtHeight:cellData.titleString forContentWidth:screenWidth - 2*LPSpaceHorizontalEdge fotFontSize:S_font(16)];
        
        cellData.cellHeight = 105.0 - 16 + titleLabelHeight;
    }
}

#pragma mark - Set and Get

- (LPBaseLabel *)serialLabel {
    if (!_serialLabel ) {
        _serialLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(14) textColor:AKColor_IgnoreTitle];
    }
    return _serialLabel;
}

- (LPBaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(16) textColor:AKColor_Title];
    }
    return _titleLabel;
}

- (LPBaseLabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(14) textColor:AKColor_Blue];
    }
    return _resultLabel;
}

- (UIButton *)quesTypeBtn {
    if (!_quesTypeBtn) {
        _quesTypeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _quesTypeBtn.userInteractionEnabled = NO;
        [_quesTypeBtn setTintColor:AKColor_IgnoreTitle];
        [_quesTypeBtn.titleLabel setTextColor:AKColor_IgnoreTitle];
        [_quesTypeBtn.titleLabel setFont:S_font(10)];
        _quesTypeBtn.contentEdgeInsets = UIEdgeInsetsMake(3, 6, 3, 6);
        _quesTypeBtn.layer.borderColor = AKColor_Gray.CGColor;
        _quesTypeBtn.layer.borderWidth = 0.5;
        _quesTypeBtn.layer.cornerRadius = 8;
    }
    return _quesTypeBtn;
}

- (LPBaseLabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(14) textColor:AKColor_Yellow];
    }
    return _timeLabel;
}

- (LPBaseLabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(16) textColor:AKColor_Red];
    }
    return _moneyLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
