//
//  UILabel+Additions.m
//  ShuaLian
//
//  Created by odyang on 16/9/28.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import "UILabel+Additions.h"

#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define LPColorTitle        HEXCOLOR(0x333333)   // 重要标题/文本框已填写内容/正文文字颜色

@implementation UILabel (Additions)

+ (instancetype)subTitleWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor {
    UILabel *lblSub = [[UILabel alloc] initWithFrame:frame];
    lblSub.backgroundColor = backgroundColor;
    lblSub.textColor = LPColorTitle;
    lblSub.font = [UIFont systemFontOfSize:14];
    return lblSub;
}

- (instancetype)copy {
    UILabel *lblNew = [[UILabel alloc] initWithFrame:self.frame];
    lblNew.font = self.font;
    lblNew.textColor = self.textColor;
    lblNew.backgroundColor = self.backgroundColor;
    lblNew.layer.cornerRadius = self.layer.cornerRadius;
    lblNew.layer.borderColor = self.layer.borderColor;
    lblNew.layer.borderWidth = self.layer.borderWidth;
    lblNew.layer.masksToBounds = self.layer.masksToBounds;
    lblNew.clipsToBounds = self.clipsToBounds;
    return lblNew;
}

@end
