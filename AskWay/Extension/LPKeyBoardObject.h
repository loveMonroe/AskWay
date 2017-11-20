//
//  LPKeyBoardObject.h
//  ShuaLian
//
//  Created by damion on 2017/3/14.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class LPKeyBoardObject;

@protocol LPKeyBoardObjectDelegate <NSObject>

/**
 键盘将要弹起
 
 @param keyBoardObject self
 @param notification 通知
 */
- (void)keyboardObject:(LPKeyBoardObject *)keyBoardObject responder:(UIResponder *)responder willShow:(NSNotification *)notification;

/**
 键盘将要隐藏
 
 @param keyBoardObject self
 @param notification 通知
 */
- (void)keyboardObject:(LPKeyBoardObject *)keyBoardObject responder:(UIResponder *)responder willHidden:(NSNotification *)notification;

@end

@interface LPKeyBoardObject : NSObject

@property (nonatomic, weak) id<LPKeyBoardObjectDelegate> delegate;

/**
 添加监听键盘变化的通知
 */
- (void)addKeyBoardNotifications;

@end
