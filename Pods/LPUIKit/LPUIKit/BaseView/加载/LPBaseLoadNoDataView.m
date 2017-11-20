//
//  LPBaseLoadNoDataView.m
//  LPUIKitDemo
//
//  Created by cs on 2017/2/21.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import "LPBaseLoadNoDataView.h"
#import "LPBaseView.h"
#import "LPBaseButton.h"
#import "Masonry.h"
#import "UIView+FrameGeometry.h"

@implementation LPBaseLoadNoDataView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
        self.backgroundColor = LPColorBackground;
    }
    return self;
}

- (void)configUI {
    WEAKSELF
    _bgView = [LPBaseView lp_viewWithBackgroundColor:LPColorBackground];
    [self addSubview:_bgView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf);
    }];
    
    _middleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _middleLabel.font = LPFontLevel_Five;
    _middleLabel.textColor = LPColorIgnoreTitle;
    _middleLabel.textAlignment = NSTextAlignmentCenter;
    _middleLabel.numberOfLines = 0;
    [_bgView addSubview:_middleLabel];
    
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [_bgView addSubview:_topImageView];

    _bottomButton = [LPBaseButton lp_buttonWithType:LPBaseButtonImportantType];
    _bottomButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_bottomButton addTarget:self action:@selector(noDataButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_bgView addSubview:_bottomButton];
}

#pragma mark - PublishMethod

- (void)showImage:(UIImage *)image labelText:(NSString *)labelText buttonText:(NSString *)buttonText {
    self.hidden = NO;
    _topImageView.hidden = image?NO:YES;
    if (!_topImageView.hidden) {
        _topImageView.frame = CGRectMake((screenWidth - image.size.width)/2, 0, image.size.width, image.size.height);
        _topImageView.image = image;
    }
    
    if (_topImageView.hidden) {
        _middleLabel.frame = CGRectMake(0, 0, screenWidth, 13);
    }else {
        _middleLabel.frame = CGRectMake(0, _topImageView.bottom + 18, screenWidth, 13);
    }
    _middleLabel.text = labelText;
    
    CGFloat bgViewHeight = 0;
    if (buttonText && buttonText.length > 0) {
        _bottomButton.hidden = NO;
        _bottomButton.frame = CGRectMake(screenWidth/2 - 70, _middleLabel.bottom + 35, 140, 35);
        [_bottomButton setTitle:buttonText forState:UIControlStateNormal];
        
        bgViewHeight = _bottomButton.bottom;
    } else {
        _bottomButton.hidden = YES;
        bgViewHeight = _middleLabel.bottom;
    }
    [_bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(bgViewHeight);
    }];
}

- (void)dismiss {
    self.hidden = YES;
}

- (void)noDataButtonClick {

}

@end
