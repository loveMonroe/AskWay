//
//  UILabel+LPUI.m
//  ShuaLian
//
//  Created by cs on 2017/5/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "UILabel+LPUI.h"
#import "LPUILabel.h"
#import <objc/runtime.h>
CG_INLINE void
ReplaceMethod(Class _class, SEL _originSelector, SEL _newSelector) {
    Method oriMethod = class_getInstanceMethod(_class, _originSelector);
    Method newMethod = class_getInstanceMethod(_class, _newSelector);
    BOOL isAddedMethod = class_addMethod(_class, _originSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (isAddedMethod) {
        class_replaceMethod(_class, _newSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
}

@implementation UILabel (LPUI)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ReplaceMethod([self class], @selector(setText:), @selector(lp_setText:));
        ReplaceMethod([self class], @selector(setAttributedText:), @selector(lp_setAttributedText:));
    });
}

- (void)lp_setText:(NSString *)text {
    if (!self.lp_textAttributes.count || !text) {
        [self lp_setText:text];
        return;
    }
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:self.lp_textAttributes];
    [self lp_setAttributedText:[self attributedStringWithEndKernRemoved:attributedString]];
}

// 在 lp_textAttributes 样式基础上添加用户传入的 attributedString 中包含的新样式。换句话说，如果这个方法里有样式冲突，则以 attributedText 为准
- (void)lp_setAttributedText:(NSAttributedString *)text {
    if (!self.lp_textAttributes.count || !text) {
        [self lp_setAttributedText:text];
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text.string attributes:self.lp_textAttributes];
    attributedString = [[self attributedStringWithEndKernRemoved:attributedString] mutableCopy];
    [text enumerateAttributesInRange:NSMakeRange(0, text.length) options:0 usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        [attributedString addAttributes:attrs range:range];
    }];
    [self lp_setAttributedText:attributedString];
}

static char kAssociatedObjectKey_textAttributes;
// 在现有样式基础上增加 lp_textAttributes 样式。换句话说，如果这个方法里有样式冲突，则以 lp_textAttributes 为准
- (void)setLp_textAttributes:(NSDictionary<NSString *, id> *)lp_textAttributes {
    NSDictionary *prevTextAttributes = self.lp_textAttributes;
    if ([prevTextAttributes isEqualToDictionary:lp_textAttributes]) {
        return;
    }
    
    objc_setAssociatedObject(self, &kAssociatedObjectKey_textAttributes, lp_textAttributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (!self.text.length) {
        return;
    }
    NSMutableAttributedString *string = [self.attributedText mutableCopy];
    NSRange fullRange = NSMakeRange(0, string.length);
    
    // 1）清除掉旧的通过 lp_textAttributes 设置的样式
    if (prevTextAttributes) {
        // 找出现在 attributedText 中哪些 attrs 是通过上次的 lp_textAttributes 设置的
        NSMutableArray *willRemovedAttributes = [NSMutableArray array];
        [string enumerateAttributesInRange:NSMakeRange(0, string.length) options:0 usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
            // 如果存在 kern 属性，则只有 range 是第一个字至倒数第二个字，才有可能是通过 lp_textAttribtus 设置的
            if (NSEqualRanges(range, NSMakeRange(0, string.length - 1)) && [attrs[NSKernAttributeName] isEqualToNumber:prevTextAttributes[NSKernAttributeName]]) {
                [string removeAttribute:NSKernAttributeName range:NSMakeRange(0, string.length - 1)];
            }
            // 上面排除掉 kern 属性后，如果 range 不是整个字符串，那肯定不是通过 lp_textAttributes 设置的
            if (!NSEqualRanges(range, fullRange)) {
                return;
            }
            [attrs enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull attr, id  _Nonnull value, BOOL * _Nonnull stop) {
                if (prevTextAttributes[attr] == value) {
                    [willRemovedAttributes addObject:attr];
                }
            }];
        }];
        [willRemovedAttributes enumerateObjectsUsingBlock:^(id  _Nonnull attr, NSUInteger idx, BOOL * _Nonnull stop) {
            [string removeAttribute:attr range:fullRange];
        }];
    }
    
    // 2）添加新样式
    if (lp_textAttributes) {
        [string addAttributes:lp_textAttributes range:fullRange];
    }
    // 不能调用 setAttributedText: ，否则若遇到样式冲突，那个方法会让用户传进来的 NSAttributedString 样式覆盖 lp_textAttributes 的样式
    [self lp_setAttributedText:[self attributedStringWithEndKernRemoved:string]];
}

- (NSDictionary *)lp_textAttributes {
    return (NSDictionary *)objc_getAssociatedObject(self, &kAssociatedObjectKey_textAttributes);
}

// 去除最后一个字的 kern 效果，使得文字整体在视觉上居中
- (NSAttributedString *)attributedStringWithEndKernRemoved:(NSAttributedString *)string {
    if (!string || !string.length) {
        return string;
    }
    NSMutableAttributedString *attributedString = nil;
    if ([string isKindOfClass:[NSMutableAttributedString class]]) {
        attributedString = (NSMutableAttributedString *)string;
    } else {
        attributedString = [string mutableCopy];
    }
    [attributedString removeAttribute:NSKernAttributeName range:NSMakeRange(string.length - 1, 1)];
    return [[NSAttributedString alloc] initWithAttributedString:attributedString];
}

- (void)lp_setTheSameAppearanceAsLabel:(UILabel *)label {
    self.font = label.font;
    self.textColor = label.textColor;
    self.backgroundColor = label.backgroundColor;
    self.lineBreakMode = label.lineBreakMode;
    self.textAlignment = label.textAlignment;
    if ([self respondsToSelector:@selector(contentEdgeInsets)] && [label respondsToSelector:@selector(contentEdgeInsets)]) {
        ((LPUILabel *)self).contentEdgeInsets = ((LPUILabel *)label).contentEdgeInsets;
    }
}

@end
