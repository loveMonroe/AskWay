//
//  LPViewAssistTools.m
//  ShuaLian
//
//  Created by 虞谦 on 2017/5/18.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import "AKViewAssistTools.h"

@implementation AKViewAssistTools

#pragma mark - 给空间加边框
+ (void)addBorder:(UIView *)view color:(UIColor *)color width:(float)width
{
    view.layer.borderColor = color.CGColor;
    view.layer.borderWidth = width;
}

#pragma mark - 删除所有子视图
+ (void)removeAllSubView:(UIView *)oneView
{
    for (UIView *subView in oneView.subviews) {
        [subView removeFromSuperview];
    }
}

#pragma mark - 画虚线
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineRect:(CGRect)lineRect
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineRect)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, lineRect.origin.x, lineRect.origin.y);
    CGPathAddLineToPoint(path, NULL, lineRect.origin.x+lineRect.size.width, lineRect.origin.y+lineRect.size.height);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

+ (BOOL)textField:(UITextField *)textField decimalInputInRange:(NSRange)range replacementString:(NSString *)string decimalNum: (NSInteger)num
{
    BOOL isHaveDot = YES;
    // 限制小数点的输入
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        isHaveDot = NO;
    }
    if ([string length] > 0)
    {
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.')//数据格式正确
        {
            //首字母不能为0和小数点
            if([textField.text length]==0){
                if(single == '.'){
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
                if (single == '0') {
                    if (range.location == 3)
                    {
                        return NO;
                    }
                }
            }
            if (single == '.')
            {
                if(!isHaveDot)//text中还没有小数点
                {
                    return YES;
                }else
                {
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            else
            {
                if (isHaveDot)//存在小数点
                {
                    //判断小数点的位数
                    NSRange ran=[textField.text rangeOfString:@"."];
                    NSUInteger t = range.location-ran.location;
                    if (num >= 1 && t <= num){
                        return YES;
                    }else{
                        return NO;
                    }
                }
                else
                {
                    return YES;
                }
            }
        }else{//输入的数据格式不正确
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    
    return YES;
}

//设置行间距
+ (void)setSpaceOfLine:(UILabel *)label string:(NSString *)string space:(NSInteger )space{
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle1.lineBreakMode = NSLineBreakByCharWrapping;
    [paragraphStyle1 setLineSpacing:space];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [string length])];
    [label setAttributedText:attributedString1];
    [label sizeToFit];
}

+ (void)showTAOverlayWithLabel:(NSString *)label {
    
}

+ (void)showTAOverlayNotAllowUserInteractionWithLabel:(NSString *)label
{
    
}

@end
