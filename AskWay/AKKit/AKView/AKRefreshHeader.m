//
//  AKRefreshHeader.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKRefreshHeader.h"

CGFloat const AKRefreshHeaderHeight = 80;


@interface AKRefreshHeader () {
    __unsafe_unretained LPRefreshView * _animationView;
}

/**
 动画视图
 */
@property (weak, nonatomic, readonly) LPRefreshView * animationView;

/**
 是否结束了下拉刷新
 */
@property (nonatomic, assign) BOOL isEndPullRefresh;

@end


@implementation AKRefreshHeader

- (LPRefreshView *)animationView
{
    if (!_animationView) {
        LPRefreshView * animationView = [[LPRefreshView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, AKRefreshHeaderHeight)];
        animationView.backgroundColor = [UIColor clearColor];
        [self addSubview:_animationView = animationView];
    }
    
    return _animationView;
}

#pragma mark - 构造方法
+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    AKRefreshHeader *cmp = [[self alloc] init];
    cmp.noEnddelayTime = NO;
    cmp.refreshingBlock = refreshingBlock;
    return cmp;
}

#pragma mark - 覆盖父类的方法
- (void)prepare
{
    [super prepare];
    self.mj_h = AKRefreshHeaderHeight;
}

- (void)placeSubviews
{
    [super placeSubviews];
    self.animationView.frame = self.bounds;
    self.animationView.contentMode = UIViewContentModeCenter;
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    if (pullingPercent <= 1 && !_isEndPullRefresh) {
        [self.animationView showZoomScale:pullingPercent];
    }
    
    if (_isEndPullRefresh) {
        _isEndPullRefresh = NO;
    }
    
    return;
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    if (state != MJRefreshStateIdle && state != MJRefreshStateNoMoreData) {
        [self.animationView showZoomScale:1];
    }
    if (state == MJRefreshStateRefreshing) {
        [self.animationView beginAnimation];
    }
}

- (void)endRefreshing
{
    if (_noEnddelayTime) {
        _isEndPullRefresh = YES;
        [self.animationView endAnimation];
        [self.animationView dismiss];
        [super endRefreshing];
    } else {
        [self performSelector:@selector(endBlock) withObject:nil afterDelay:0.5];
    }
}

- (void)endBlock
{
    dispatch_async(dispatch_get_main_queue(), ^{
        _isEndPullRefresh = YES;
        [self.animationView endAnimation];
        [self.animationView dismiss];
        [super endRefreshing];
    });
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
