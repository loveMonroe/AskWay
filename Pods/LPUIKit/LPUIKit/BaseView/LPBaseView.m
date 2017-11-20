//
//  LPBaseView.m
//  LPUIKitDemo
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import "LPBaseView.h"

@implementation LPBaseView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
//        self.backgroundColor = LPColorBackground;
    }
    return self;
}

+ (LPBaseView *)lp_viewWithFrame:(CGRect )frame backgroundColor:(UIColor *)backgroundColor{
    
    LPBaseView *view = [[[self class] alloc] initWithFrame:frame];
    view.backgroundColor = backgroundColor;
    return view;
}

+ (LPBaseView *)lp_viewWithBackgroundColor:(UIColor *)backgroundColor{
    LPBaseView *view = [[self class] lp_viewWithFrame:CGRectZero backgroundColor:backgroundColor];
    return view;
}

- (void)configUI {
    
}

- (void)bindData:(id)object {
    
}

- (void)makeCorner:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}

@end
