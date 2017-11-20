//
//  UIViewController+Custom.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>

@optional

-(BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (Custom) <BackButtonHandlerProtocol>

@end
