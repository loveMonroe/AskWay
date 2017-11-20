//
//  UIViewController+CustomBar.m
//  ShuaLian
//
//  Created by wangshen on 16/11/17.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import "UIViewController+CustomBar.h"
#import "UIViewController+NavigationItem.h"
#import <objc/runtime.h>

static char customBarKey;
static char aTitleLabelKey;
static char aBackBarButtonKey;
static char isSetCustomKey;
static char aRightBarTextButtonKey;

@implementation UIViewController (CustomBar)


+ (void)load{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(lp_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });


}

//自定义 getter 导航栏
- (UIView *)lp_customBar{

    UIView *bar = objc_getAssociatedObject(self, &customBarKey);
    if (!bar) {
        bar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 64)];
        objc_setAssociatedObject(self, &customBarKey, bar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return bar;

}



//自定义 title label
- (UILabel *)lp_aTitleLabel{

    UILabel *label = objc_getAssociatedObject(self, &aTitleLabelKey);
    if (!label) {
        
        label = [[UILabel alloc] init];
        label.textColor = LPColorWhite;
        label.font = [UIFont systemFontOfSize:18];
        label.textAlignment = NSTextAlignmentCenter;
        objc_setAssociatedObject(self, &aTitleLabelKey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    return label;
}

//自定义 backBarButton
- (LPNaviBackButton *)lp_aBackBarButton{

    LPNaviBackButton *btn = objc_getAssociatedObject(self, &aBackBarButtonKey);
    if (!btn) {
        btn = [[LPNaviBackButton  alloc] initWithFrame:CGRectMake(12, 20, 44, 44)];
      
        
        objc_setAssociatedObject(self, &aBackBarButtonKey, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return btn;
}

- (LPCustomBarButton *)lp_aRightBarTextButton{

    LPCustomBarButton *btn = objc_getAssociatedObject(self, &aRightBarTextButtonKey);
    if (!btn) {
        btn = [[LPCustomBarButton  alloc] initWithFrame:CGRectMake(screenWidth - 92, 20, 80, 44)];
        btn.customButtonContentMode = LPCustomButtonContentModeRight;
        btn.titleLabel.font = S_font(15);
        objc_setAssociatedObject(self, &aRightBarTextButtonKey, btn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return btn;
}


- (UIView *)lp_addCustomBarWithColor:(UIColor *)color{

    objc_setAssociatedObject(self, &isSetCustomKey, @1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIView *bar = [self lp_customBar];
    bar.backgroundColor = color;
    [self.view addSubview:bar];
    return bar;
}

- (void)lp_removeCustomBar {

    [[self lp_customBar] removeFromSuperview];
}

- (UILabel *)lp_setCustomBarTitle:(NSString *)title{

    UILabel *label = [self lp_aTitleLabel];
    label.text = title;
    [label sizeToFit];
    label.center = CGPointMake(screenWidth/2.0, 42);
    [[self lp_customBar] addSubview:label];
    return label;
}


- (void)lp_addCustomView:(UIView *)view{

    [[self lp_customBar] addSubview:view];
}



//设置 backButton
- (UIButton *)lp_setBackBarButtonWithTitle:(NSString *)title  image:(NSString *)image tinColor:(UIColor *)color {

//    LPNaviBackButton *btn = [self lp_aBackBarButton];
//    [btn addTarget:self action:@selector(lp_backBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTitle:title forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
//
//    [btn setTitleColor:color forState:UIControlStateNormal];
//    btn.titleLabel.font = S_font(15);
//    [[self lp_customBar] addSubview:btn];
//    
//    return btn;
    return [self lp_setBackBarButtonWithTitle:title image:image tinColor:color action:@selector(lp_backBarButtonAction:)];
}

//设置 backButton   带action的
- (UIButton *)lp_setBackBarButtonWithTitle:(NSString *)title  image:(NSString *)image tinColor:(UIColor *)color action:(SEL )action {
    LPNaviBackButton *btn = [self lp_aBackBarButton];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = S_font(15);
    [[self lp_customBar] addSubview:btn];
    return btn;
}

- (UIButton *)lp_setRightBarButtonWithTitle:(NSString *)title tinColor:(UIColor *)color action:(SEL)action{

    LPCustomBarButton *btn = [self lp_aRightBarTextButton];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [[self lp_customBar] addSubview:btn];
    
    return btn;

}
//隐藏导航条的情况下设置自定义导航条上的右边的按钮 (图片)
- (UIButton * )lp_setRightBarButtonWithImageName:(NSString *)imageName action:(SEL )action {
    LPCustomBarButton *btn = [self lp_aRightBarTextButton];
//    [btn setTitle:title forState:UIControlStateNormal];
//    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.customButtonContentMode = LPCustomButtonContentModeImageRight;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [[self lp_customBar] addSubview:btn];
    
    return btn;
}

#pragma mark - 方法交换 

- (void)lp_viewWillAppear:(BOOL )animation{

    [self lp_viewWillAppear:animation];
    
    NSNumber *isSetCustomBar = objc_getAssociatedObject(self, &isSetCustomKey);
    if (isSetCustomBar && [isSetCustomBar isEqualToNumber:@1]) {
        [self.view bringSubviewToFront:[self lp_customBar]];
        
    }
    
}

- (void)lp_backBarButtonAction:(UIButton *)sender{

    [self.navigationController popViewControllerAnimated:YES];
}




@end
