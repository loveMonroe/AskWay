//
//  AKNavigationController.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKNavigationController.h"

#import "UINavigationController+FDFullscreenPopGesture.h"
#import "UIViewController+Custom.h"
#import "UIViewController+NavigationItem.h"

#define LPMaxPopGestureLeftEdge screenWidth / 2

@interface AKNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, retain) NSArray *noBar_viewControllers;

@property (nonatomic, retain) NSDictionary *specialLeftTitleDictionary;

@property (nonatomic, assign) BOOL isGestureAction; //判断当前是不是通过手势返回的

@end

@implementation AKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isGestureAction = NO;
    // Do any additional setup after loading the view.
    //    [self _addEdgeGestureToPop];
    self.delegate = self;
    self.view.backgroundColor = LPColorWhite;
    self.fd_MaxPopGestureLeftEdge =  LPMaxPopGestureLeftEdge;
}

#pragma mark - Overwrite func

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (!viewController) {
        return;
    } //viewController是nil
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    if (self.viewControllers.count != 0) {
        [self _setBackBarButtonItemWithViewController:viewController];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    UIViewController *vc = self.topViewController;
    BOOL canPop = YES;
    if ([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        canPop = [vc navigationShouldPopOnBackButton];
    }
    
    if (canPop) {
        return [super popViewControllerAnimated:animated];
    } else {
        return nil;
    }
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    UIViewController *vc = self.topViewController;
    BOOL canPop = YES;
    if ([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        canPop = [vc navigationShouldPopOnBackButton];
    }
    if (canPop) {
        return [super popToRootViewControllerAnimated:animated];
    } else {
        return nil;
    }
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated force:(BOOL)force {
    if (force) {
        return [super popViewControllerAnimated:animated];
    } else {
        return [self popViewControllerAnimated:animated];
    }
}

#pragma mark - 私有方法
//设置  返回item样式
- (void)_setBackBarButtonItemWithViewController:(UIViewController *)viewController {
    
    if ([viewController isKindOfClass:NSClassFromString(@"LPBaseWebViewController")]) {
        return;
    }
    NSString *title = [self _getBackButtonItemTitleWithViewController:viewController];
    [viewController lp_setupNavLeftItemWithTitle:title image:LPNavigationBackItemImageName target:self action:@selector(backBarButtonItemAction:)];
}

//设置 返回按钮的问题  从上个页面的标题上获得 （有些页面需要特殊设置）
- (NSString *)_getBackButtonItemTitleWithViewController:(UIViewController *)viewController {
    
    NSString *className = NSStringFromClass([viewController class]);
    
    NSString *title = [self.specialLeftTitleDictionary objectForKey:className];
    if (!title) {
        title = @"返回";
    }
    return title;
}

//左侧边缘滑动返回手势
- (void)_addEdgeGestureToPop {
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL selector = NSSelectorFromString(@"handleNavigationTransition:");
    UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:target action:selector];
    pan.delegate = self;
    [pan setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:pan];
    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma mark - Action

- (void)backBarButtonItemAction:(UIButton *)sender{
    [self popViewControllerAnimated:YES];
    
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    self.isGestureAction = YES;
    return YES;
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
