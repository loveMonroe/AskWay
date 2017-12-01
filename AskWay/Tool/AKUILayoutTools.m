//
//  LPUILayoutTools.m
//  ShuaLian
//
//  Created by 虞谦 on 2017/5/18.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "AKUILayoutTools.h"

@implementation AKUILayoutTools

+ (CGSize)getStringSize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)size
{
    CGSize sz = CGSizeZero;
    NSDictionary *attr = @{NSFontAttributeName:font};
    
    if (iOS7)
    {
        NSString *str = string;
        CGRect r = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil];
        sz = r.size;
        sz.height += 5;
    }
    else
    {
        NSAttributedString *str =[[NSAttributedString alloc] initWithString:string attributes:attr];
        CGRect r = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        sz = r.size;
        sz.height += 5;
    }
    return sz ;
}


//该方法根据传入的字体等参数返回高度
+ (float)getTxtHeight:(NSString *)content forContentWidth:(float)content_width fotFontSize:(UIFont *)font
{
    //设置一个行高上限
    CGSize size = CGSizeMake(content_width,MAXFLOAT);
    //计算实际frame大小，并将label的frame变成实际大小
    
    NSMutableDictionary *param=[[NSMutableDictionary alloc]init];
    
    [param setObject:font forKey:NSFontAttributeName];
    CGRect labelsize = [content boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:param context:nil];
    return labelsize.size.height+0.1;
}

//获取Label高度
+ (float)getHeight:(UILabel *)label
{
    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
    return size.height;
}

//获取Label宽度
+ (float)getWidth:(UILabel *)label
{
    CGRect rect = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 25) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:label.font} context:nil];
    return rect.size.width;
}

+ (float)getWidth:(NSString *)str font:(UIFont *)font
{
    CGRect rect = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, 25) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}

+ (float)getScaleWidth:(int)width
{
    float scaleWidth;
    scaleWidth = (float)width / 320 * screenWidth;
    return scaleWidth;
}

+ (UIFont *)getMutableFont:(int)font
{
    if (iPhone4 || iPhone5) {
        return S_font(font);
    }else if (iPhone6){
        return S_font(font+1);
    }else if (iPhone6P) {
        return S_font(font+2);
    }
    return
    S_font(font);
}


@end
