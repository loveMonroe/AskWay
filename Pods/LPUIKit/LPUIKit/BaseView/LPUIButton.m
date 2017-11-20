//
//  LPUIButton.m
//  ShuaLian
//
//  Created by cs on 2017/5/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPUIButton.h"
#import "UIImage+LPUI.h"
#import "LPUIMacros.h"

@implementation LPUIButton

#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+ (instancetype)lp_buttonWithType:(LPUIButtonType)type title:(NSString *)title {
    return [[self class] lp_buttonWithFrame:CGRectZero type:type title:title];
}

+ (instancetype)lp_buttonWithFrame:(CGRect)frame type:(LPUIButtonType)type title:(NSString *)title {
    LPUIButton *button = [[LPUIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:[LPUIButton getNormalBackGroundImageWithType:type] forState:UIControlStateNormal];
    [button setBackgroundImage:[LPUIButton getHighlightedBackGroundImageWithType:type] forState:UIControlStateHighlighted];
    [button setTitleColor:[LPUIButton getNormalTextColorWithType:type] forState:UIControlStateNormal];
    [button setTitleColor:[LPUIButton getHighlightedTextColorWithType:type] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateDisabled];

    if(type == LPUIButtonImportantType) {
        [button setBackgroundImage:[LPUIButton getDisabledBackGroundImageWithType:type] forState:UIControlStateDisabled];
        [button setTitleColor:[LPUIButton getDisabledTextColorWithType:type] forState:UIControlStateDisabled];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 2.5;
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
    }
    
    return button;
}

#pragma mark - UI

+ (UIImage *)getNormalBackGroundImageWithType:(LPUIButtonType)type {
    switch (type) {
        case LPUIButtonImportantType:
            return [UIImage imageWithColor:LPColorAvailableButton];
        default:
            return nil;
    }
}

+ (UIImage *)getHighlightedBackGroundImageWithType:(LPUIButtonType)type {
    switch (type) {
        case LPUIButtonImportantType:
            return [UIImage imageWithColor:LPColorHighlightButton];
        default:
            return nil;
    }
}

+ (UIImage *)getDisabledBackGroundImageWithType:(LPUIButtonType)type {
    switch (type) {
        case LPUIButtonImportantType:
            return [UIImage imageWithColor:LPColorUnavailableButton];
        default:
            return nil;
    }
}

+ (UIColor *)getNormalTextColorWithType:(LPUIButtonType)type {
    switch (type) {
        case LPUIButtonImportantType:
            return LPColorWhite;
        default:
            return nil;
    }
}

+ (UIColor *)getHighlightedTextColorWithType:(LPUIButtonType)type {
    switch (type) {
        case LPUIButtonImportantType:
            return LPColorHighlightTextButton;
        default:
            return nil;
    }
}

+ (UIColor *)getDisabledTextColorWithType:(LPUIButtonType)type {
    switch (type) {
        case LPUIButtonImportantType:
            return LPColorHighlightTextButton;
        default:
            return nil;
    }
}

#pragma mark - UIAction

- (void)btnClick:(UIButton *)sender {
    if (self.buttonClickBlock) {
        self.buttonClickBlock();
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event {
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(_hotSize.width - bounds.size.width, 0);
    CGFloat heightDelta = MAX(_hotSize.height - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

- (void)dealloc {
    self.buttonClickBlock = nil;
}

@end


@interface LPUILinkButton ()

/**
 下划线
 */
@property(nonatomic, strong) CALayer *underlineLayer;

@end

@implementation LPUILinkButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self didInitialized];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self didInitialized];
    }
    return self;
}

+ (instancetype)lp_buttonWithFrame:(CGRect)frame type:(LPUIButtonType)type title:(NSString *)title {
    LPUILinkButton *button = [[LPUILinkButton alloc] initWithFrame:frame];
    [button setBackgroundImage:[LPUILinkButton getNormalBackGroundImageWithType:type] forState:UIControlStateNormal];
    [button setBackgroundImage:[LPUILinkButton getHighlightedBackGroundImageWithType:type] forState:UIControlStateHighlighted];
    [button setTitleColor:[LPUILinkButton getNormalTextColorWithType:type] forState:UIControlStateNormal];
    [button setTitleColor:[LPUILinkButton getHighlightedTextColorWithType:type] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateDisabled];
    
    if(type == LPUIButtonImportantType) {
        [button setBackgroundImage:[LPUILinkButton getDisabledBackGroundImageWithType:type] forState:UIControlStateDisabled];
        [button setTitleColor:[LPUILinkButton getDisabledTextColorWithType:type] forState:UIControlStateDisabled];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 2.5;
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
    }
    
    return button;
}

- (void)didInitialized {
    self.underlineLayer = [CALayer layer];
    [self.layer addSublayer:self.underlineLayer];
    
    self.underlineHidden = NO;
    self.underlineWidth = 1;
    self.underlineColor = nil;
    self.underlineInsets = UIEdgeInsetsZero;
}

- (void)setUnderlineHidden:(BOOL)underlineHidden {
    _underlineHidden = underlineHidden;
    self.underlineLayer.hidden = underlineHidden;
}

- (void)setUnderlineWidth:(CGFloat)underlineWidth {
    _underlineWidth = underlineWidth;
    [self setNeedsLayout];
}

- (void)setUnderlineColor:(UIColor *)underlineColor {
    _underlineColor = underlineColor;
    [self updateUnderlineColor];
}

- (void)setUnderlineInsets:(UIEdgeInsets)underlineInsets {
    _underlineInsets = underlineInsets;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.underlineLayer.hidden) {
        self.underlineLayer.frame = CGRectMake(self.underlineInsets.left, CGRectGetMaxY(self.titleLabel.frame) + self.underlineInsets.top - self.underlineInsets.bottom, CGRectGetWidth(self.bounds) - self.underlineInsets.left - self.underlineInsets.right, self.underlineWidth);
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    [self updateUnderlineColor];
}

- (void)updateUnderlineColor {
    UIColor *color = self.underlineColor ? : [self titleColorForState:UIControlStateNormal];
    self.underlineLayer.backgroundColor = color.CGColor;
}

@end


