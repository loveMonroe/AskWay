//
//  LPBaseButton.m
//  LPUIKitDemo
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import "LPBaseButton.h"
#import "LPUIMacros.h"

@implementation LPBaseButton

+ (LPBaseButton *)lp_buttonWithType:(LPBaseButtonType)type {
    return [[self class] lp_buttonWithFrame:CGRectZero type:type];
}

+ (LPBaseButton *)lp_buttonWithFrame:(CGRect)frame type:(LPBaseButtonType)type {
    LPBaseButton *button = [[LPBaseButton alloc] initWithFrame:frame];
    [button setBackgroundImage:[LPBaseButton getNormalBackGroundImageWithType:type] forState:UIControlStateNormal];
    [button setBackgroundImage:[LPBaseButton getHighlightedBackGroundImageWithType:type] forState:UIControlStateHighlighted];
    [button setTitleColor:[LPBaseButton getNormalTextColorWithType:type] forState:UIControlStateNormal];
    [button setTitleColor:[LPBaseButton getHighlightedTextColorWithType:type] forState:UIControlStateHighlighted];
    
    if(type == LPBaseButtonImportantType || type == LPBaseButtonNormalType || type == LPBaseButtonBottomType || type == LPBaseButtonGoldenType || type == LPBaseButtonRedType) {
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [button setBackgroundImage:[LPBaseButton getDisabledBackGroundImageWithType:type] forState:UIControlStateDisabled];
        [button setTitleColor:[LPBaseButton getDisabledTextColorWithType:type] forState:UIControlStateDisabled];
        if (type != LPBaseButtonBottomType) {
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = 2.5;
            button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        }
    }else {
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        if (type == LPBaseButtonToolImportantType || type == LPBaseButtonToolNormalType) {
            button.layer.cornerRadius = 2.5;
        }else {
            button.layer.cornerRadius = 12.5;
        }
    }
    
    return button;
}

+ (UIImage *)getNormalBackGroundImageWithType:(LPBaseButtonType)type {
    switch (type) {
        case LPBaseButtonImportantType:
            return [UIImage imageWithColor:LPColorAvailableButton];
        case LPBaseButtonNormalType:
        case LPBaseButtonToolImportantType:
        case LPBaseButtonListImportantType:
        case LPBaseButtonToolNormalType:
        case LPBaseButtonListNormalType:
            return [UIImage imageWithColor:LPColorWhite];
        case LPBaseButtonBottomType:
            return [UIImage imageWithColor:LPColorAvailableButton];
        case LPBaseButtonRedType:
            return [UIImage imageWithColor:HEXCOLOR(0xE84542)];
        case LPBaseButtonGoldenType:
            return [UIImage imageWithColor:LPColorGoldenButton];
        default:
            return nil;
    }
}

+ (UIImage *)getHighlightedBackGroundImageWithType:(LPBaseButtonType)type {
    switch (type) {
        case LPBaseButtonImportantType:
        case LPBaseButtonBottomType:
            return [UIImage imageWithColor:LPColorHighlightButton];
        case LPBaseButtonNormalType:
        case LPBaseButtonToolImportantType:
        case LPBaseButtonListImportantType:
            return [UIImage imageWithColor:HEXCOLOR(0xfef6f6)];
        case LPBaseButtonToolNormalType:
        case LPBaseButtonListNormalType:
            return [UIImage imageWithColor:HEXCOLOR(0xf2f2f2)];
        case LPBaseButtonGoldenType:
            return [UIImage imageWithColor:LPColorGoldenButton];
        default:
            return nil;
    }
}

+ (UIImage *)getDisabledBackGroundImageWithType:(LPBaseButtonType)type {
    switch (type) {
        case LPBaseButtonImportantType:
        case LPBaseButtonBottomType:
            return [UIImage imageWithColor:LPColorUnavailableButton];
        case LPBaseButtonNormalType:
            return [UIImage imageWithColor:HEXCOLOR(0xdfdfdf)];
        case LPBaseButtonRedType:
            return [UIImage imageWithColor:HEXCOLOR(0xf3a2a0)];
        case LPBaseButtonGoldenType:
            return [UIImage imageWithColor:LPColorGoldenUnavailablen];
        default:
            return nil;
    }
}

+ (UIColor *)getNormalTextColorWithType:(LPBaseButtonType)type {
    switch (type) {
        case LPBaseButtonImportantType:
        case LPBaseButtonBottomType:
        case LPBaseButtonGoldenType:
        case LPBaseButtonRedType:
            return LPColorWhite;
        case LPBaseButtonNormalType:
        case LPBaseButtonListImportantType:
        case LPBaseButtonToolImportantType:
            return LPColorBrand;
        case LPBaseButtonListNormalType:
        case LPBaseButtonToolNormalType:
            return LPColorSubTitle;
        default:
            return nil;
    }
}

+ (UIColor *)getHighlightedTextColorWithType:(LPBaseButtonType)type {
    switch (type) {
        case LPBaseButtonImportantType:
        case LPBaseButtonBottomType:
            return LPColorHighlightTextButton;
        case LPBaseButtonNormalType:
        case LPBaseButtonListImportantType:
        case LPBaseButtonToolImportantType:
            return LPColorBrand;
        case LPBaseButtonListNormalType:
        case LPBaseButtonToolNormalType:
            return LPColorSubTitle;
        case LPBaseButtonGoldenType:
            return LPColorWhite;
        default:
            return nil;
    }
}

+ (UIColor *)getDisabledTextColorWithType:(LPBaseButtonType)type {
    switch (type) {
        case LPBaseButtonImportantType:
        case LPBaseButtonBottomType:
            return LPColorHighlightTextButton;
        case LPBaseButtonNormalType:
            return HEXCOLOR(0xcccccc);
        case LPBaseButtonRedType:
            return HEXCOLOR(0xf9d1d0);
        case LPBaseButtonGoldenType:
            return LPColorWhite;
        default:
            return nil;
    }
}

@end
