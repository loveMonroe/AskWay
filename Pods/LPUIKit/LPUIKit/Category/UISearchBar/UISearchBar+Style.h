//
//  UISearchBar+Style.h
//  LPUIKitDemo
//
//  Created by cs on 2017/2/10.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (Style)

/**
 设置searchBar的背景颜色

 @param color 颜色
 */
- (void)configBackgroundColor:(UIColor *)color;

/**
 设置搜索框的背景颜色

 @param color 颜色
 */
- (void)configSearchTextFieldBackgroundColor:(UIColor *)color;

@end
