//
//  UIImage+Utility.m
//  XHImageViewer
//
//  Created by 曾 宪华 on 14-2-18.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "UIImage+Utility.h"

@implementation UIImage (Utility)

+ (UIImage *)fastImageWithData:(NSData *)data {
    return [UIImage imageWithData:data];
}

+ (UIImage *)fastImageWithContentsOfFile:(NSString *)path {
    return [[UIImage alloc] initWithContentsOfFile:path];
}

///绘制虚线
+ (UIImage *)drawDashed:(CGRect)rect lineColor:(UIColor *)color {
    CGFloat width = rect.size.width;
    UIGraphicsBeginImageContext(CGSizeMake(width, 0.5));   //开始画线
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);  //设置线条终点形状
    
    CGFloat lengths[] = {3,1};
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(line, 0.5);
    CGContextSetStrokeColorWithColor(line, color.CGColor);
    
    CGContextSetLineDash(line, 0, lengths, 2);  //画虚线
    CGContextMoveToPoint(line, 0.0, 0.0);    //开始画线
    CGContextAddLineToPoint(line, width, 0);
    CGContextStrokePath(line);
    UIImage *dashedImage = UIGraphicsGetImageFromCurrentImageContext();
    return dashedImage;
}

- (CGSize)adjustSize:(CGSize)toSize {
    return [self.class adjustImage:self.size toSize:toSize];
}

+ (CGSize)adjustImage:(CGSize)size toSize:(CGSize)toSize {
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat maxWidth = toSize.width;//最大宽度
    CGFloat maxHeight = toSize.height;//最大高度
    if (maxWidth >0 && maxHeight == 0) {
        //限制宽度
        if (width <= maxWidth) {
            return size;
        }else {
            return CGSizeMake(maxWidth, maxWidth/width*height);
        }
    }else if (maxWidth == 0 && maxHeight > 0) {
        //限制高度
        if (height <= maxHeight) {
            return size;
        }else {
            return CGSizeMake(maxHeight/height*width, maxHeight);
        }
    }else if (maxWidth >0 && maxHeight > 0) {
        //限制宽高
        if (width <= maxWidth && height <= maxHeight) {
            return size;
        }else if (width > maxWidth && height > maxHeight) {
            if (width/height >= maxWidth/maxHeight) {
                //宽占比较大
                return CGSizeMake(maxWidth, maxWidth/width*height);
            }else {
                return CGSizeMake(maxHeight/height*width, maxHeight);
            }
        }else if (width > maxWidth && height <= maxHeight) {
            return CGSizeMake(maxWidth, maxWidth/width*height);
        }else {
            return CGSizeMake(maxHeight/height*width, maxHeight);
        }
    }
    else {
        //不限制宽高
        return size;
    }
}

+ (UIImage *)imageWithColor:(UIColor*)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0,0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)circleImageWithColor:(UIColor *)color raduis:(CGFloat)raduis {
    CGRect rect = CGRectMake(0,0, raduis*2, raduis*2);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextAddArc(context, raduis, raduis, raduis, 0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
