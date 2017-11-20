//
//  LPKeyBoardObject.m
//  ShuaLian
//
//  Created by damion on 2017/3/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPKeyBoardObject.h"

@interface LPKeyBoardObject ()

/**
 保存获取到的第一响应者
 */
@property (nonatomic, weak) UIResponder *aFirstResponder;

@end

@implementation LPKeyBoardObject

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)addKeyBoardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Notification

- (void)keyBoardWillShow:(NSNotification *)notification {
    UIResponder *firstResponder =  [self _getFirstResponder];
    if (!firstResponder) {
        firstResponder = self.aFirstResponder;
    }else {
        self.aFirstResponder = firstResponder;
    }
    UIResponder *responder = firstResponder.nextResponder;
    while (![responder isKindOfClass:[UIViewController class]] && responder != nil) {
        responder = responder.nextResponder;
    }
    UIViewController *vc = (UIViewController *)self.delegate;
    if ((UIViewController *)responder == vc) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardObject:responder:willShow:)]) {
            [self.delegate keyboardObject:self responder:firstResponder willShow:notification];
        }
    }
}

- (void)keyBoardWillHidden:(NSNotification *)notification {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardObject:responder:willHidden:)]) {
        [self.delegate keyboardObject:self responder:[self _getFirstResponder] willHidden:notification];
    }
}

#pragma mark - 私有方法
- (UIResponder *)_getFirstResponder{
    
    //消除警告 - @selector(firstResponder) 这个方法是系统方法 不需要定义
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIResponder *aFirstResponder = [keyWindow performSelector:@selector(firstResponder)];
    return aFirstResponder;
#pragma clang diagnostic pop
    
}

@end
