//
//  AKLoadNoDataView.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKLoadNoDataView.h"

@interface AKLoadNoDataView ()

@property (nonatomic, assign) AKLoadNoDataType noDataType;

@end

@implementation AKLoadNoDataView

- (void)showWithNoDataType:(AKLoadNoDataType)type {
    WEAKSELF
    weakSelf.noDataType = type;
    [weakSelf showImage:[AKLoadNoDataView getImageWithType:type] labelText:[AKLoadNoDataView getLabelTextWithType:type] buttonText:[AKLoadNoDataView getButtonTitleWithType:type]];
}

- (void)dismiss {
    [super dismiss];
}

- (void)noDataButtonClick {
    if ([_delegate respondsToSelector:@selector(loadNoDataViewClickButton:)]) {
        [_delegate loadNoDataViewClickButton:_noDataType];
    }
}

- (void)configureTop:(CGFloat)top height:(CGFloat)height {
    self.frame = CGRectMake(0, top, screenWidth, height);
}

#pragma mark - 配置

+ (UIImage *)getImageWithType:(AKLoadNoDataType)type {
    switch (type) {
        case AKLoadNoDataNone:
            return [UIImage imageNamed:@""];
        default:
            return nil;
    }
}

+ (NSString *)getLabelTextWithType:(AKLoadNoDataType)type {
    switch (type) {
        case AKLoadNoDataNone:
            return @"";
        default:
            return @"";
    }
}

+ (NSString *)getButtonTitleWithType:(AKLoadNoDataType)type {
    switch (type) {
        case AKLoadNoDataNone:
            return @"";
        default:
            return nil;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
