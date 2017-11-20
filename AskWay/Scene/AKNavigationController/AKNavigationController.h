//
//  AKNavigationController.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKNavigationController : UINavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
                                          force:(BOOL)force;

@end
