//
//  UIViewController+NavigationItem.m
//  WJSQ
//
//  Created by TYRBL on 16/5/4.
//  Copyright © 2016年 Senro Wang. All rights reserved.
//

#import "UIViewController+NavigationItem.h"
#import <objc/runtime.h>

@implementation UIViewController (NavigationItem)

- (void)lp_setupNavBackItemWithAction:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"BAR-返回"] style:UIBarButtonItemStylePlain target:self action:action];
    
    self.navigationItem.leftBarButtonItems = @[[self _createNegativeSeperator], item];
}

- (void)lp_setupNavLeftItemWithTitle:(NSString *)title action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:S_font(16),NSForegroundColorAttributeName:LPColorSubTitle} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[[self _createNegativeSeperatorWithWidth:(iOS10)?-4:4], item];
}

- (void)lp_setupNavLeftItemWithImage:(NSString *)image action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:image] style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.leftBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-1], item];
}

- (void)lp_setupNavRightItemWithTitle:(NSString *)title action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:action];
    [item setTitleTextAttributes:@{NSFontAttributeName:S_font(16),NSForegroundColorAttributeName:LPColorSubTitle} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-4], item];
}

- (void)lp_setupNavRightItemWithImage:(NSString *)image action:(SEL)action {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:image] style:UIBarButtonItemStylePlain target:self action:action];
    self.navigationItem.rightBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-7], item];
}



/** 右边按钮 图片的 */
- (UIButton *)lp_setupNavRightCustomItemWithImage:(NSString *)image action:(SEL)action{

    LPCustomBarButton *rightButton = [LPCustomBarButton buttonWithType:UIButtonTypeCustom];    //右上角按钮
    rightButton.frame = CGRectMake(0.0, 0.0, 44, 44);
    rightButton.customButtonContentMode = LPCustomButtonContentModeImageRight;
    [rightButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-4],rightBarButtonItem];
    return rightButton;
    
}

- (UIButton *)lp_setupNavRightCustomItemWithTitle:(NSString *)title action:(SEL)action{


    LPCustomBarButton *rightButton = [LPCustomBarButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 44);
    [rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:LPColorSubTitle forState:UIControlStateNormal];
    [rightButton setTitleColor:HEXACOLOR(0x666666, 0.4f) forState:UIControlStateDisabled];
    rightButton.customButtonContentMode = LPCustomButtonContentModeRight;

    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-4],rightBarButtonItem];
    return rightButton;
}


static const char ItemHandlerKey = '\0';
static const CGFloat itemWidth = 35;
static const CGFloat itemMargin = 2;
- (NSArray<__kindof UIButton *> *)lp_setupNavRightItemsWithImageNames:(NSArray *)imageNames andHandler:(void(^)(NSUInteger itemIndex))block {
    objc_setAssociatedObject(self, &ItemHandlerKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    NSUInteger count = imageNames.count;
    UIView *itemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, itemWidth * count + itemMargin * (count-1), 44)];
    NSMutableArray *btns = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger i = 0; i < count; i++) {
        NSString *imageName = imageNames[i];
        UIButton *btn = [self _createButtonWithX:(itemWidth + itemMargin) * i  imageName:imageName tag:i];
        [itemView addSubview:btn];
        [btns addObject:btn];
    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemView];
    
    self.navigationItem.rightBarButtonItems = @[[self _createNegativeSeperator], item];
    return btns;
}


/** 右边按钮 文字的 可自定义颜色的*/
- (UIButton *)lp_setupNavRightItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action{
    
    LPCustomBarButton *rightButton = [LPCustomBarButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 44);
    [rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton setTitleColor:color forState:UIControlStateNormal];
    rightButton.customButtonContentMode = LPCustomButtonContentModeRight;
    
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-4],rightBarButtonItem];
    return rightButton;

}


/** 左边 按钮  文字 和 图片 都有的*/
- (UIButton *)lp_setupNavLeftItemWithTitle:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action{

    LPNaviBackButton *button = [LPNaviBackButton buttonWithType:UIButtonTypeCustom];

    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.titleLabel.font = S_font(16);
    [button setTitleColor:LPColorSubTitle forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    backItem.tintColor = LPColorSubTitle;

    self.navigationItem.leftBarButtonItems = @[[self _createNegativeSeperatorWithWidth:-4],backItem];
    return button;
}


/** 修改 导航栏左边按钮的颜色*/
- (void)lp_changeLeftButtonItemStyle:(LPItemTinColorStyle )style{
    for (UIBarButtonItem *item in self.navigationItem.leftBarButtonItems) {
        
        if (item.customView) {
             LPNaviBackButton *button = (LPNaviBackButton *)item.customView;
            if (style == LPItemTinColorStyleWhite) {
                [button setTitleColor:LPColorWhite forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"icon_nav_arrow_white"] forState:UIControlStateNormal];
            }else{
            
                [button setTitleColor:LPColorSubTitle forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"icon_nav_arrow"] forState:UIControlStateNormal];
            }
        }
    }
}

- (void)lp_changeRightButtonItemTitleStyle:(LPItemTinColorStyle )style{
    for (UIBarButtonItem *item in self.navigationItem.rightBarButtonItems) {
        if (item.customView) {
            LPNaviBackButton *button = (LPNaviBackButton *)item.customView;
            if (style == LPItemTinColorStyleWhite) {
                [button setTitleColor:LPColorWhite forState:UIControlStateNormal];
               
            }else{
                [button setTitleColor:LPColorSubTitle forState:UIControlStateNormal];
            }
        }
    }

}

//获取上一个试图控制器的title （当前试图控制器已经在导航控制器的栈中）
- (NSString *)lp_previousViewControllerTitle{

    if(!self.navigationController){return nil;}
    NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
    if (index >= 1) {
        UIViewController *vc = self.navigationController.viewControllers[index - 1];
        return vc.navigationItem.title;
    }else{
        return  nil;
    }
}


#pragma mark - Private

- (UIBarButtonItem *)_createNegativeSeperator {
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -10;
    return negativeSeperator;
}
//－16 图标正好贴到边
- (UIBarButtonItem *)_createNegativeSeperatorWithWidth:(CGFloat ) width{
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = width;
    return negativeSeperator;
}

- (UIButton *)_createButtonWithX:(CGFloat)x imageName:(NSString *)imgName tag:(NSUInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(x, 0, itemWidth, 44);
    btn.tag = tag;
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.adjustsImageWhenHighlighted = NO;
    btn.adjustsImageWhenDisabled = NO;
    return btn;
}




#pragma mark - Action
- (void)itemClick:(UIButton *)item {
    void(^block)(NSUInteger index) = objc_getAssociatedObject(self, &ItemHandlerKey);
    block(item.tag);
}



@end




#pragma mark - LPCustomBarButton

//保存 属性的key
static  char originalActionKey;
static char targetKey;

@implementation LPCustomBarButton


#pragma mark - overWrite Function
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    if (controlEvents == UIControlEventTouchUpInside) {
        
        
        [self _addEventObserverWithTarget:target originalAction:action];
        return ;
    }
    
    [super addTarget:target action:action forControlEvents:controlEvents];
}



#pragma mark - Action

- (void)_addEventObserverWithTarget:(id)target originalAction:(SEL )originalAction{
    
    NSString *actionName = NSStringFromSelector(originalAction);
    objc_setAssociatedObject(self, &originalActionKey, actionName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
     objc_setAssociatedObject(self, &targetKey, target, OBJC_ASSOCIATION_ASSIGN);
    [super addTarget:self action:@selector(backBarButtonItemTouchupInSide:) forControlEvents:UIControlEventTouchUpInside];
    [super addTarget:self action:@selector(backBarButtonItemTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    [super addTarget:self action:@selector(backBarButtonItemTouchDown:) forControlEvents:UIControlEventTouchDown];
    [super addTarget:self action:@selector(backBarButtonItemTouchUpOutSide:) forControlEvents:UIControlEventTouchUpOutside];
}


- (void)backBarButtonItemTouchDown:(UIButton *)sender{
    
    sender.alpha = 0.2;
}

- (void)backBarButtonItemTouchUpOutSide:(UIButton *)sender{
    
    sender.alpha = 1.0f;
}

- (void)backBarButtonItemTouchCancel:(UIButton *)sender{
    sender.alpha = 1.0f;
}

- (void)backBarButtonItemTouchupInSide:(UIButton *)sender{
    
    sender.alpha = 1.0f;
        
    id target = objc_getAssociatedObject(sender, &targetKey);
    NSString *actionName = objc_getAssociatedObject(sender, &originalActionKey);
    SEL action = NSSelectorFromString(actionName);
    if (target && [target respondsToSelector:action]) {
        
        //函数指针的方式
//        IMP imp = [target methodForSelector:action];
//        void (*func)(id, SEL) = (void *)imp;
//        func(target, action);
//#pragma clang diagnostic ignored"-Wundeclared-selector"
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:action withObject:self];
#pragma clang diagnostic pop
        
    }
    
    
}

#pragma mark - Overwrite function
- (void)layoutSubviews{
    
    
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    if (self.customButtonContentMode == LPCustomButtonContentModeLeft) {
         self.titleLabel.textAlignment = NSTextAlignmentLeft;
        CGRect frame = self.titleLabel.frame;
        self.titleLabel.frame = CGRectMake(0, 0, frame.size.width, CGRectGetHeight(self.frame));
    }
    if (self.customButtonContentMode == LPCustomButtonContentModeRight) {
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        CGRect frame = self.titleLabel.frame;
        self.titleLabel.frame = CGRectMake(CGRectGetWidth(self.frame) - frame.size.width, 0, frame.size.width, CGRectGetHeight(self.frame));
    }
    
    if (self.customButtonContentMode == LPCustomButtonContentModeImageLeft) {
        CGRect frame = self.imageView.frame;
        self.imageView.contentMode = UIViewContentModeLeft;
        self.imageView.frame = CGRectMake(0, 0, frame.size.width, CGRectGetHeight(self.frame));
    }
    
    if (self.customButtonContentMode == LPCustomButtonContentModeImageRight) {
        CGRect frame = self.imageView.frame;
        self.imageView.contentMode = UIViewContentModeRight;
        self.imageView.frame = CGRectMake(CGRectGetWidth(self.frame) - frame.size.width, 0, frame.size.width, CGRectGetHeight(self.frame));
    }
   
    
}




@end




#pragma mark - LPNaviBackButton

//返回 按钮文字距离图标的距离是 7
@implementation LPNaviBackButton


- (void)layoutSubviews{

    
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.imageView.frame = CGRectMake(0, (self.height - 18)/2, 10, 18);
    self.titleLabel.frame = CGRectMake(14, (self.height - 18)/2,self.titleLabel.width, 18);

}

@end
