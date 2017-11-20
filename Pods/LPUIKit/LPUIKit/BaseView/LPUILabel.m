//
//  LPUILabel.m
//  ShuaLian
//
//  Created by cs on 2017/5/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "LPUILabel.h"
#import "LPUIMacros.h"

@interface LPUILabel()

@property(nonatomic, strong) UIColor *tempBackgroundColor;
@property(nonatomic, strong) UILongPressGestureRecognizer *longGestureRecognizer;

@end

@implementation LPUILabel

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat edgeInsetsGetHorizontalValue = self.contentEdgeInsets.left + self.contentEdgeInsets.right;
    CGFloat edgeInsetsGetVerticalValue = self.contentEdgeInsets.top + self.contentEdgeInsets.bottom;
    
    size = [super sizeThatFits:CGSizeMake(size.width - edgeInsetsGetHorizontalValue, size.height - edgeInsetsGetVerticalValue)];
    size.width += edgeInsetsGetHorizontalValue;
    size.height += edgeInsetsGetVerticalValue;
    return size;
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.contentEdgeInsets)];
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor {
    if (highlightedBackgroundColor) {
        self.tempBackgroundColor = self.backgroundColor;
        _highlightedBackgroundColor = highlightedBackgroundColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (self.highlightedBackgroundColor) {
        self.backgroundColor = highlighted ? self.highlightedBackgroundColor : self.tempBackgroundColor;
    }
}

#pragma mark - 长按复制功能

- (void)setCanPerformCopyAction:(BOOL)canPerformCopyAction {
    _canPerformCopyAction = canPerformCopyAction;
    if (_canPerformCopyAction && !self.longGestureRecognizer) {
        self.userInteractionEnabled = YES;
        self.longGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestureRecognizer:)];
        [self addGestureRecognizer:self.longGestureRecognizer];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMenuWillHideNotification:) name:UIMenuControllerWillHideMenuNotification object:nil];
        
        if (!self.highlightedBackgroundColor) {
            self.highlightedBackgroundColor = LPColorBackground; // 设置个默认值
        }
    } else if (!_canPerformCopyAction && self.longGestureRecognizer) {
        [self removeGestureRecognizer:self.longGestureRecognizer];
        self.longGestureRecognizer = nil;
        self.userInteractionEnabled = NO;
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}

- (BOOL)canBecomeFirstResponder {
    return self.canPerformCopyAction;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if ([self canBecomeFirstResponder]) {
        return action == @selector(copyString:);
    }
    return NO;
}

- (void)copyString:(id)sender {
    if (self.canPerformCopyAction) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        if (self.text) {
            pasteboard.string = self.text;
        }
    }
}

- (void)handleLongPressGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (!self.canPerformCopyAction) {
        return;
    }
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *copyMenuItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyString:)];
        [[UIMenuController sharedMenuController] setMenuItems:@[copyMenuItem]];
        [menuController setTargetRect:self.frame inView:self.superview];
        [menuController setMenuVisible:YES animated:YES];
        
        // 默认背景色
        self.tempBackgroundColor = self.backgroundColor;
        self.backgroundColor = self.highlightedBackgroundColor;
    }
}

- (void)handleMenuWillHideNotification:(NSNotification *)notification {
    if (!self.canPerformCopyAction) {
        return;
    }
    if (self.tempBackgroundColor) {
        self.backgroundColor = self.tempBackgroundColor;
    }
}

#pragma mark - 初始化

/**
 创建label
 
 @param frame frame
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             type:(LPUILabelType)type {
    UIFont *font;
    UIColor *color;
    switch (type) {
        case LPUILabelTypeTitle: {
            font = [UIFont systemFontOfSize:15.0];
            color = LPColorTitle;
        }
            break;
        case LPUILabelTypeSubTitle: {
            font = [UIFont systemFontOfSize:14.0];
            color = LPColorSubTitle;
        }
            break;
        case LPUILabelTypeIgnoreTitle:{
            font = [UIFont systemFontOfSize:12.0];
            color = LPColorIgnoreTitle;
        }
            break;
        default:
            break;
    }
    
    return [LPUILabel lp_labelWithFrame:frame font:font textColor:color textAlignment:NSTextAlignmentLeft];
}

/**
 创建label
 
 @param type 类型
 @return 对象
 */
+ (instancetype)lp_labelWithType:(LPUILabelType)type {
    return [LPUILabel lp_labelWithFrame:CGRectZero type:type];
}

/**
 创建label
 
 @param frame frame
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor {
    return [LPUILabel lp_labelWithFrame:frame font:font textColor:textColor textAlignment:NSTextAlignmentLeft];
}

/**
 创建label
 
 @param frame frame
 @param font 字体大小
 @param textColor 字体颜色
 @param textAlignment 对齐方式
 @return 对象
 */
+ (instancetype)lp_labelWithFrame:(CGRect)frame
                             font:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment {
    LPUILabel *label = [[LPUILabel alloc] initWithFrame:frame];
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.backgroundColor = LPColorWhite;
    return label;
}

/**
 创建label
 
 @param font 字体大小
 @param textColor 字体颜色
 @return 对象
 */
+ (instancetype)lp_labelWithFont:(UIFont *)font
                       textColor:(UIColor *)textColor {
    return [LPUILabel lp_labelWithFrame:CGRectZero font:font textColor:textColor textAlignment:NSTextAlignmentLeft];
    
}

/**
 创建label
 
 @param font 字体大小
 @param textColor 字体颜色
 @param textAlignment 对齐方式
 @return 对象
 */
+ (instancetype)lp_labelWithFont:(UIFont *)font
                       textColor:(UIColor *)textColor
                   textAlignment:(NSTextAlignment)textAlignment {
    return [LPUILabel lp_labelWithFrame:CGRectZero font:font textColor:textColor textAlignment:textAlignment];
}

@end
