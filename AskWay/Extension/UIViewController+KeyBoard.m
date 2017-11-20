//
//  UIViewController+KeyBoard.m
//  ShuaLian
//
//  Created by wangshen on 17/3/2.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "UIViewController+KeyBoard.h"
#import <objc/runtime.h>



static char LPKeyBoardObjectKey;
static char LPKeyBoardRespondViewKey;



@implementation UIViewController (KeyBoard)


- (void)lp_setAutoKeyBoardEnable {
    
    LPKeyBoardObject *keyBoard = [self lp_keyBoardObject];
    [keyBoard addKeyBoardNotifications];
    keyBoard.delegate = self;
    
}

- (void)lp_setAutoKeyBoardEnableOnView:(UIView *)view {
    
    [self lp_setRespondView:view];
    [self lp_setAutoKeyBoardEnable];

}

- (void)lp_tapSpaceHiddenKeyBoard {
    
    UITapGestureRecognizer *lp_TapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lp_TapAction:)];
    lp_TapGesture.numberOfTapsRequired = 1;
    lp_TapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:lp_TapGesture];
}


#pragma mark - getter
- (LPKeyBoardObject *)lp_keyBoardObject {
    
    LPKeyBoardObject *keyBoardObject = objc_getAssociatedObject(self, &LPKeyBoardObjectKey);
    if (!keyBoardObject) {
        keyBoardObject = [[LPKeyBoardObject alloc] init];
        [self lp_setKeyBoardObject:keyBoardObject];
    }
    return keyBoardObject;
}

- (UIView *)lp_RespondView {
    
    UIView *view = objc_getAssociatedObject(self, &LPKeyBoardRespondViewKey);
    if (!view) {
        view = self.view;
    }
    return view;
}

#pragma mark - setter

- (void)lp_setKeyBoardObject:(LPKeyBoardObject *)keyBoardObject {
    
    objc_setAssociatedObject(self, &LPKeyBoardObjectKey, keyBoardObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)lp_setRespondView:(UIView *)view {
    objc_setAssociatedObject(self, &LPKeyBoardRespondViewKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - 私有方法
- (UIResponder *)lp_firstResponder{
    
    //消除警告 - @selector(firstResponder) 这个方法是系统方法 不需要定义
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIResponder *aFirstResponder = [keyWindow performSelector:@selector(firstResponder)];
    return aFirstResponder;
#pragma clang diagnostic pop
    
}


#pragma mark - Action

- (void)lp_TapAction:(UITapGestureRecognizer *)tapGesture{
    // 获取当前的第一响应者  -- 缩回键盘
    UIResponder *aFirstResponder = [self lp_firstResponder];
    [aFirstResponder resignFirstResponder];
}




#pragma mark - LPKeyBoardObjectDelegate
// 系统九宫格 汉字键盘 会出现一些奇怪的现象 通知会走两次 第一次  键盘高度是 216 （6p 上 是 226 ） 第二次是真实的高度 （其余未测试）
- (void)keyboardObject:(LPKeyBoardObject *)keyBoardObject responder:(UIResponder *)responder willShow:(NSNotification *)notification {
    
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    UIView *textField = (UITextField *)responder;
    UIView *superView = textField.superview;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect convertFrame = [superView convertRect:textField.frame toView:keyWindow];
    
    UIView *respondView = [self lp_RespondView];
    
    CGFloat distance = (keyWindow.frame.size.height - keyboardBounds.size.height) - (convertFrame.size.height + convertFrame.origin.y + LPTextFieldKeyBoardOffset);
    if (distance + respondView.transform.ty < 0) {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:[duration doubleValue]];
        [UIView setAnimationCurve:[curve intValue]];
        [UIView setAnimationDelegate:self];
        respondView.transform = CGAffineTransformMakeTranslation(0, distance + respondView.transform.ty);
        [UIView commitAnimations];
    }
    //    if (self.isViewTransiting) {
    //        self.aSelectPayView.left = -self.view.width;
    //        self.aTransitingView.left = 0;
    //    }else {
    //        self.aTransitingView.top = self.aContentView.height - KKeyBoardHeight - self.aTransitingView.height + 7;
    //    }
    //    [UIView commitAnimations];
    //    self.isViewTransiting = NO;
    //    self.isKeyBoardShowing = YES
}

- (void)keyboardObject:(LPKeyBoardObject *)keyBoardObject responder:(UIResponder *)responder willHidden:(NSNotification *)notification {
    
    CGRect keyboardBounds;
    [[notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    UIView *respondView = [self lp_RespondView];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationDelegate:self];
    respondView.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView commitAnimations];
    //    if (self.isViewTransiting) {
    //        self.aSelectPayView.left = 0;
    //        self.aTransitingView.left = self.view.width;
    //    }else{
    //        self.aTransitingView.top = self.aContentView.height - self.aTransitingView.height;
    //    }
    //    [UIView commitAnimations];
    //    self.isViewTransiting = NO;
    //    self.isKeyBoardShowing = NO;
}


@end
