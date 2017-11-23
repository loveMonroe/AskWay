//
//  AppDelegate+Root.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AppDelegate+Root.h"

#import "AKTabBarController.h"

@implementation AppDelegate (Root)

- (void)configRootViewController {
    AKTabBarController *tabVC = [[AKTabBarController alloc] init];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    [self _configBasicNavigationBar];
}

- (void)_configBasicNavigationBar {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    UIImage *backgroundImage = [UIImage imageWithColor:LPColorWhite];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName: [UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName: LPColorTitle,
                                     };
    [navigationBarAppearance setBackgroundImage:backgroundImage
                                  forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setShadowImage:[UIImage new]];
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    [[UINavigationBar appearance] setTintColor:LPColorTitle];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

@end
