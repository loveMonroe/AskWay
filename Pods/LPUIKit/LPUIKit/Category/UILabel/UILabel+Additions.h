//
//  UILabel+Additions.h
//  ShuaLian
//
//  Created by odyang on 16/9/28.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Additions)

#pragma mark - 通用标签定义

/**
 *  次级标题:颜色#33333、字体：14px
 * @param   backgroundColor 背景色
 */
+ (instancetype)subTitleWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor;


/**
 复制UILabel

 @return 创建一个相同字体、颜色、背景色的UILabel
 */
- (instancetype)copy;

@end
