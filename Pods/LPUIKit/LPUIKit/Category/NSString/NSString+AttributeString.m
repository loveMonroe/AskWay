//
//  NSString+AttributeString.m
//  ShuaLian
//
//  Created by wangshen on 16/12/26.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import "NSString+AttributeString.h"

@implementation NSString (AttributeString)

- (NSMutableAttributedString *)attributedStringWithcolor:(UIColor *)color subString:(NSString *)subString {
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    if (!subString || ![subString isKindOfClass:[NSString class]]) {
        
        return attributedString;
    }
    NSRange range = [self rangeOfString:subString];
    if (range.location != NSNotFound) {
        
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(range.location, range.length)];
    }
    return attributedString;
}


- (NSMutableAttributedString *)attributedStringWithAttributeds:(NSDictionary *)attributeds subString:(NSString *)subString {
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    if (!subString || ![subString isKindOfClass:[NSString class]]) {
        
        return attributedString;
    }
    NSRange range = [self rangeOfString:subString];
    if (range.location != NSNotFound) {
        
        [attributedString addAttributes:attributeds range:NSMakeRange(range.location, range.length)];
    }
    return attributedString;
}

- (NSMutableAttributedString *)attributedStringWithLineSpace:(CGFloat )space {

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
    return attributedString;
}

/**
 设置行间距 字间距
 
 @param space 行间距
 @return 属性字符串
 */
- (NSMutableAttributedString *)attributedStringWithLineSpace:(CGFloat )space wordSpace:(CGFloat )wordSpace {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.length)];
    [attributedString addAttribute:NSKernAttributeName value:@(wordSpace) range:NSMakeRange(0, self.length)];
    return attributedString;
}

- (CGRect)boundingRectWithSize:(CGSize)size font:(UIFont *)font lineSpace:(CGFloat)lineSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    CGSize maxSize = size;
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.string.length)];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedString.string.length)];
    return [attributedString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
}


@end
