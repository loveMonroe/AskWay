//
//  AKIAMMentorCell.m
//  AskWay
//
//  Created by damion on 2017/11/29.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKIAMMentorCell.h"


@implementation AKIAMMentorCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKIAMMentorCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 124.0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    self.nameString = @"--";
    self.jobTitle = @"--";
    self.isAuthed = NO;
}


@end


@interface AKIAMMentorCell ()

@property (nonatomic, retain) UIView *backView;

@property (nonatomic, retain) UIImageView *backImgView;

@property (nonatomic, retain) LPBaseLabel *titleLabel;

@property (nonatomic, retain) LPBaseLabel *jobTitleLabel;

@property (nonatomic, retain) UIImageView *arrowImgView;

@end


@implementation AKIAMMentorCell

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    
    [self.contentView addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.contentView).offset (6);
        make.left.equalTo (weakSelf.contentView).offset (LPSpaceHorizontalEdge);
        make.right.equalTo (weakSelf.contentView).offset (-LPSpaceHorizontalEdge);
        make.bottom.equalTo (weakSelf.contentView).offset (-6);
    }];
    
    [self.backView addSubview:self.backImgView];
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo (weakSelf.backView);
    }];
    
    [self.backView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.backView).offset(LPSpaceHorizontalEdge);
        make.top.equalTo (weakSelf.backView).offset (22);
        make.height.mas_equalTo (24);
    }];
    
    [self.backView addSubview:self.jobTitleLabel];
    [self.jobTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.titleLabel);
        make.top.equalTo (weakSelf.titleLabel.mas_bottom).offset (20);
        make.right.equalTo (weakSelf.backView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (15);
    }];
    
    [self.backView addSubview:self.arrowImgView];
    [self.arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo (14);
        make.right.equalTo (weakSelf.backView).offset (-LPSpaceHorizontalEdge);
        make.centerY.equalTo (weakSelf.backView);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - Data

- (void)bindData:(AKIAMMentorCellData *)cellData {
    [super bindData:cellData];
    
    self.titleLabel.text = cellData.nameString;
    self.jobTitleLabel.text = cellData.jobTitle;
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

- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        _backView.backgroundColor = LPColorBrand;
    }
    return _backImgView;
}

- (LPBaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [LPBaseLabel lp_labelWithText:@"" font:SB_font(24) textColor:LPColorWhite];
    }
    return _titleLabel;
}

- (LPBaseLabel *)jobTitleLabel {
    if (!_jobTitleLabel) {
        _jobTitleLabel = [LPBaseLabel lp_labelWithText:@"" font:S_font(15) textColor:LPColorWhite];
    }
    return _jobTitleLabel;
}

- (UIImageView *)arrowImgView {
    if (!_arrowImgView) {
        _arrowImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    }
    return _arrowImgView;
}

@end




@implementation AKIAMMentorQusCellData

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.className = [NSClassFromString(@"AKIAMMentorQusCell") class];
        self.cellIdentfier = NSStringFromClass(self.className);
        self.cellHeight = 124.0;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    self.qusNumber = @0;
}


@end



@interface AKIAMMentorQusCell ()

@property (nonatomic, retain) LPBaseLabel *qusLabel;

@property (nonatomic, retain) UIButton *answerBtn;

@end

@implementation AKIAMMentorQusCell

#pragma mark - UI and Action

- (void)configUI {
    
}

#pragma mark - Data

- (void)bindData:(AKIAMMentorQusCellData *)cellData {
    [super bindData:cellData];
}

#pragma mark - Set and Get

@end





