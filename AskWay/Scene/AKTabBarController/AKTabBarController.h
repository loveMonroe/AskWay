//
//  AKTabBarController.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKTabBarController : UITabBarController

/**
 添加角标

 @param string 内容
 @param index 位置
 */
-(void)addBadgeString:(NSString *) string withIndex:(NSInteger) index;

@end
