//
//  UINavigationController+BackForward.m
//  ShuaLian
//
//  Created by wangshen on 2017/7/4.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "UINavigationController+BackForward.h"

@implementation UINavigationController (BackForward)

- (void)lp_popToViewControllerWithClassName:(NSString *)aClassName animated:(BOOL )animated{

    NSInteger count = self.viewControllers.count;
    if (count == 0) {
        return ;
    }
    
    UIViewController *popVC;
    for (NSInteger i = count - 1; i >= 0; i --) {
        UIViewController *vc = self.viewControllers[i];
        NSString *vcName = NSStringFromClass([vc class]);
        if([vcName isEqualToString:aClassName]){
            popVC = vc;
            break ;
        }
    }
    [self popToViewController:popVC animated:animated];
}

- (void)lp_pushViewControllerWithCloseCurrent:(UIViewController *)viewContoller animated:(BOOL )animated {

//    NSArray *array = self.viewControllers;
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:self.viewControllers];
    [muArray removeLastObject];
    if (viewContoller) {
        [muArray addObject:viewContoller];
        [self setViewControllers:muArray animated:animated];
    }
    
}

@end
