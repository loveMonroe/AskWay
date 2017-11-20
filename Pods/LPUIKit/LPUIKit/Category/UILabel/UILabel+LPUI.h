//
//  UILabel+LPUI.h
//  ShuaLian
//
//  Created by cs on 2017/5/13.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LPUI)

/**
 * @brief 在需要特殊样式时，可通过此属性直接给整个 label 添加 NSAttributeName 系列样式，然后 setText 即可，无需使用繁琐的 attributedText
 *
 * @note 即使先调用 setText/attributedText ，然后再设置此属性，此属性仍然会生效
 * @note 如果此属性包含了 NSKernAttributeName ，则最后一个字的 kern 效果会自动被移除，否则容易导致文字在视觉上不居中
 *
 * 现在你有三种方法控制 label 的样式：
 * 1. 本身的样式属性（如 textColor, font 等）
 * 2. lp_textAttributes
 * 3. 构造 NSAttributedString
 * 这三种方式可以同时使用，如果样式发生冲突（比如先通过方法1将文字设成红色，又通过方法2将文字设成蓝色），则绝大部分情况下代码执行顺序靠后的会最终生效
 * 唯一例外的极端情况是：先用方法2将文字设成红色，再用方法1将文字设成蓝色，最后再 setText，这时虽然代码执行顺序靠后的是方法1，但最终生效的会是方法2，为了避免这种极端情况的困扰，建议不要同时使用方法1和方法2去设置同一种样式。
 *
 */
@property(nonatomic, copy) NSDictionary<NSString *, id> *lp_textAttributes;

/**
 * 将目标UILabel的样式属性设置到当前UILabel上
 *
 * 将会复制的样式属性包括：font、textColor、backgroundColor
 * @param label 要从哪个目标UILabel上复制样式
 */
- (void)lp_setTheSameAppearanceAsLabel:(UILabel *)label;

@end
