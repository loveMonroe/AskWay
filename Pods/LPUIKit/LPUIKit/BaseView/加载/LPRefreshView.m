//
//  LPRefreshView.m
//  ShuaLian
//
//  Created by apple on 16/8/5.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import "LPRefreshView.h"
#import "PocketSVG.h"
#import "LPBaseView.h"

@interface LPRefreshView()<CAAnimationDelegate>
/// 背景视图
@property (nonatomic, strong) UIView * bgView;
/// 灰色的S
@property (nonatomic, strong) CAShapeLayer * bgShapeLayer;
/// 红色的S
@property (nonatomic, strong) CAShapeLayer * animationShapeLayer;
/// 当前显示的是否是红色的S
@property (nonatomic, assign) BOOL showAnimationShapeLayer;
/// 是否取消动画
@property (nonatomic, assign) BOOL cancelAnimation;

@end

@implementation LPRefreshView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configUI {
    _bgView = [LPBaseView lp_viewWithFrame:self.bounds backgroundColor:LPColorClear];
    [self addSubview:_bgView];
    
    UIBezierPath *circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:CGPointMake(screenWidth/2, 30) radius:15 startAngle:0 endAngle:2*M_PI clockwise:TRUE];
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.lineWidth = 1.5;
    circleLayer.strokeColor = LPColorAvailableButton.CGColor;
    circleLayer.lineJoin = kCALineJoinRound;
    circleLayer.path = circlePath.CGPath;
    [_bgView.layer addSublayer:circleLayer];
    
    for (SVGBezierPath *path in [SVGBezierPath pathsFromSVGString:@"LPUIKit.bundle/pullRefresh"]) {
        _bgShapeLayer = [CAShapeLayer layer];
        _bgShapeLayer.path = path.CGPath;
        _bgShapeLayer.strokeColor = HEXCOLOR(0xcbcbcb).CGColor;
        _bgShapeLayer.lineWidth = 3;
        _bgShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _bgShapeLayer.frame = CGRectMake(screenWidth/2 - 30, 0, 60, 60);
        _bgShapeLayer.transform = CATransform3DMakeScale(0.5, .5, 0.5);
        _bgShapeLayer.lineCap = kCALineCapRound;
        [_bgView.layer addSublayer:_bgShapeLayer];
        
        _animationShapeLayer = [CAShapeLayer layer];
        _animationShapeLayer.path = path.CGPath;
        _animationShapeLayer.strokeColor = LPColorAvailableButton.CGColor;
        _animationShapeLayer.lineWidth = 2.4;
        _animationShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _animationShapeLayer.frame = CGRectMake(screenWidth/2 - 30, 0, 60, 60);
        _animationShapeLayer.transform = CATransform3DMakeScale(0.5, .5, 0.5);
        _animationShapeLayer.lineCap = kCALineCapRound;
    }
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 57, screenWidth, 13)];
    textLabel.text = @"因为刷脸 所以相信";
    textLabel.font = LPFontLevel_Five;
    textLabel.textColor = LPColorIgnoreTitle;
    textLabel.textAlignment = NSTextAlignmentCenter;
    [_bgView addSubview:textLabel];
    
    _bgView.transform = CGAffineTransformMakeScale(0.1,0.1);
}

#pragma mark - UIAction

- (void)showZoomScale:(CGFloat)zoomScale {
    if (zoomScale > 1 || zoomScale == 0) {
        return;
    }
    
    [_bgView.layer removeAllAnimations];
    _bgView.transform = CGAffineTransformMakeScale(zoomScale,zoomScale);
}

- (void)dismiss {
    [UIView animateWithDuration:0.4 animations:^{
        _bgView.transform=CGAffineTransformMakeScale(0.1, 0.1);
    }];
}

- (void)beginAnimation {
    _cancelAnimation = NO;
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.delegate = self;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.735 :0 :0.275 :1];
    _showAnimationShapeLayer = !_showAnimationShapeLayer;
    if(_showAnimationShapeLayer) {
        [_animationShapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
        [_bgView.layer addSublayer:_animationShapeLayer];
    }else {
        [_bgShapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
        [_bgView.layer addSublayer:_bgShapeLayer];
    }
}

- (void)endAnimation {
    _cancelAnimation = YES;
    _showAnimationShapeLayer = NO;
    [_bgShapeLayer removeAllAnimations];
    if(![_bgShapeLayer.superlayer isEqual:_bgView.layer]) {
        [_bgView.layer addSublayer:_bgShapeLayer];
    }
    [_animationShapeLayer removeAllAnimations];
    [_animationShapeLayer removeFromSuperlayer];
}

#pragma mark - CABasicAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if(_showAnimationShapeLayer) {
        [_bgShapeLayer removeAllAnimations];
        [_bgShapeLayer removeFromSuperlayer];
    }else {
        [_animationShapeLayer removeAllAnimations];
        [_animationShapeLayer removeFromSuperlayer];
    }

    if(_cancelAnimation){
        if(![_bgShapeLayer.superlayer isEqual:_bgView.layer]) {
            [_bgView.layer addSublayer:_bgShapeLayer];
        }
    }else {
        [self beginAnimation];
    }
}

@end
