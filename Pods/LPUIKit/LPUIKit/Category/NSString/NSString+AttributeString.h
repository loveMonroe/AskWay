//
//  NSString+AttributeString.h
//  ShuaLian
//
//  Created by wangshen on 16/12/26.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AttributeString)


/**
 属性字符串 指定子串变色

 @param color 颜色
 @param subString 需要处理的 子串
 @return 属性字符串
 */
- (NSMutableAttributedString *)attributedStringWithcolor:(UIColor *)color subString:(NSString *)subString;

/**
 属性字符串 指定子串改变显示效果

 @param attributeds 需要添加的字符属性
 @param subString 需要处理的子串
 @return 属性字符串
 */
- (NSMutableAttributedString *)attributedStringWithAttributeds:(NSDictionary *)attributeds subString:(NSString *)subString;

/**
 设置行间距

 @param space 行间距
 @return 属性字符串
 */
- (NSMutableAttributedString *)attributedStringWithLineSpace:(CGFloat )space;

/**
 设置行间距 字间距
 
 @param space 行间距
 @return 属性字符串
 */
- (NSMutableAttributedString *)attributedStringWithLineSpace:(CGFloat )space wordSpace:(CGFloat )wordSpace;

/**
 根据宽度、字体、行间距计算文本高度

 @param size 显示范围
 @param font 字体
 @param lineSpace 行间距
 @return frame
 */
- (CGRect)boundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpace:(CGFloat)lineSpace;


@end
