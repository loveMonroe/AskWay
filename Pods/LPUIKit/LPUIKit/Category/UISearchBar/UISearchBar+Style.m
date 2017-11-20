//
//  UISearchBar+Style.m
//  LPUIKitDemo
//
//  Created by cs on 2017/2/10.
//  Copyright © 2017年 BestFace. All rights reserved.
//

#import "UISearchBar+Style.h"

@implementation UISearchBar (Style)

- (void)configBackgroundColor:(UIColor *)color {
    self.backgroundColor = color;
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backgroundImage = image;
}

- (void)configSearchTextFieldBackgroundColor:(UIColor *)color {
    self.barTintColor = [UIColor whiteColor];
    for (UIView *subView in self.subviews.firstObject.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:@"UISearchBarTextField"]) {
            subView.backgroundColor = color;
            break;
        }
    }
}



@end
