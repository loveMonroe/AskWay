//
//  NSMutableParagraphStyle+LPUI.m
//  ShuaLian
//
//  Created by cs on 2017/5/15.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "NSMutableParagraphStyle+LPUI.h"

@implementation NSMutableParagraphStyle (LPUI)

/**
 *  快速创建一个NSMutableParagraphStyle，等同于`lp_paragraphStyleWithLineSpacing:lineBreakMode:NSLineBreakByWordWrapping textAlignment:NSTextAlignmentLeft`
 *  @param  lineSpacing      行间距
 *  @return 一个NSMutableParagraphStyle对象
 */
+ (instancetype)lp_paragraphStyleWithLineSpacing:(CGFloat)lineSpacing {
    return [self lp_paragraphStyleWithLineSpacing:lineSpacing lineBreakMode:NSLineBreakByWordWrapping textAlignment:NSTextAlignmentLeft];
}

/**
 *  快速创建一个NSMutableParagraphStyle，等同于`lp_paragraphStyleWithLineSpacing:lineBreakMode:textAlignment:NSTextAlignmentLeft`
 *  @param  lineSpacing     行间距
 *  @param  lineBreakMode   换行模式
 *  @return 一个NSMutableParagraphStyle对象
 */
+ (instancetype)lp_paragraphStyleWithLineSpacing:(CGFloat)lineSpacing lineBreakMode:(NSLineBreakMode)lineBreakMode {
    return [self lp_paragraphStyleWithLineSpacing:lineSpacing lineBreakMode:lineBreakMode textAlignment:NSTextAlignmentLeft];
}

/**
 *  快速创建一个NSMutableParagraphStyle
 *  @param  lineSpacing     行间距
 *  @param  lineBreakMode   换行模式
 *  @param  textAlignment   文本对齐方式
 *  @return 一个NSMutableParagraphStyle对象
 */
+ (instancetype)lp_paragraphStyleWithLineSpacing:(CGFloat)lineSpacing lineBreakMode:(NSLineBreakMode)lineBreakMode textAlignment:(NSTextAlignment)textAlignment {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.lineBreakMode = lineBreakMode;
    paragraphStyle.alignment = textAlignment;
    return paragraphStyle;
}

@end
