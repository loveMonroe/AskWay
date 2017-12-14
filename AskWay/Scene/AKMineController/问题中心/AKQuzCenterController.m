//
//  AKQuzCenterController.m
//  AskWay
//
//  Created by damion on 2017/12/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKQuzCenterController.h"

#import "AKFinishingQuzController.h"
#import "AKLatestQuzController.h"

#import "SGPagingView.h"

@interface AKQuzCenterController () <SGPageTitleViewDelegate, SGPageContentViewDelegate>

@property (nonatomic, retain) SGPageTitleView *pageTitleView;
@property (nonatomic, retain) SGPageContentView *pageContentView;

@end

@implementation AKQuzCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"问题中心";
    
    [self configUI];
}

#pragma mark - UI and Action

- (void)configUI {
    
    NSArray *titleArr = @[@"最新问题", @"即将结束"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorScrollStyle = SGIndicatorScrollStyleHalf;
    configure.titleFont = SB_font(14);
    configure.titleColor = AKColor_Title;
    configure.titleSelectedColor = AKColor_Title;
    configure.indicatorColor = AKColor_Blue;
    configure.indicatorHeight = 4.0;
    configure.indicatorBorderWidth = 2.0;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, screenWidth, 50) delegate:self titleNames:titleArr configure:configure];
    [self.view addSubview:_pageTitleView];
    _pageTitleView.isTitleGradientEffect = NO;
    _pageTitleView.isNeedBounces = NO;
    
    AKLatestQuzController *oneVC = [[AKLatestQuzController alloc] init];
    AKFinishingQuzController *twoVC = [[AKFinishingQuzController alloc] init];
    NSArray *childArr = @[oneVC, twoVC];
    /// pageContentView
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 50, screenWidth, screenHeight - _pageTitleView.bottom) parentVC:self childVCs:childArr];
    _pageContentView.delegatePageContentView = self;
    [self.view addSubview:_pageContentView];
    
}

#pragma mark - SGPageTitleViewDelegate

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}

#pragma mark - SGPageContentViewDelegate

- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
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
