//
//  AKRefreshViewController.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKRefreshViewController.h"

@interface AKRefreshViewController ()

/**
 加载视图
 */
@property (nonatomic, strong) AKLoadingView *loadingView;

/**
 没有数据视图
 */
@property (nonatomic, strong) AKLoadNoDataView *loadNoDataView;

@end

@implementation AKRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LPColorBackground;
}

#pragma mark - 加载

- (AKLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [[AKLoadingView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - NAVIGATION_BAR_HEIGHT)];
        [self.view addSubview:_loadingView];
    }
    return _loadingView;
}

- (AKLoadingView *)getLoadingView {
    return self.loadingView;
}

- (void)loadingViewShow {
    if ([self.loadingView.superview isEqual:self.view]) {
        [self.view bringSubviewToFront:self.loadingView];
    }
    [self.loadingView show];
    [self.loadNoDataView dismiss];
}

- (void)loadingViewShowText:(NSString *)text {
    [self.loadingView showText:text];
}

- (void)loadingViewDismiss {
    [self.loadingView dismiss];
}

- (void)configLoadingViewTop:(CGFloat)top height:(CGFloat)height {
    [self.loadingView configureTop:top height:height];
}

#pragma mark - 加载失败/无数据

- (AKLoadNoDataView *)loadNoDataView {
    if (!_loadNoDataView) {
        _loadNoDataView = [[AKLoadNoDataView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - NAVIGATION_BAR_HEIGHT)];
        _loadNoDataView.delegate = self;
        _loadNoDataView.hidden = YES;
        [self.view addSubview:_loadNoDataView];
    }
    return _loadNoDataView;
}

- (AKLoadNoDataView *)getLoadNoDataView {
    return self.loadNoDataView;
}

- (void)loadNoDataViewShowType:(AKLoadNoDataType)type {
    if ([self.loadNoDataView.superview isEqual:self.view]) {
        [self.view bringSubviewToFront:self.loadNoDataView];
    }
    [self.loadNoDataView showWithNoDataType:type];
}

- (void)loadNoDataViewDismiss {
    [self.loadNoDataView dismiss];
}

- (void)configLoadNoDataViewTop:(CGFloat)top height:(CGFloat)height {
    [self.loadNoDataView configureTop:top height:height];
}

- (void)loadNoDataViewClickButton:(AKLoadNoDataType)type {
    
}

- (void)dealloc {
    if (_loadingView) {
        [_loadingView dismiss];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
