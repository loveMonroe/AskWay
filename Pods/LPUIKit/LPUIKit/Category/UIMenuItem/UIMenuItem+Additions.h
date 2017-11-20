//
//  UIMenuItem+Additions.h
//  ShuaLian
//
//  Created by odyang on 16/8/5.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  支持block方式初始化
 */
@interface UIMenuItem (Additions)

+ (instancetype (^)(NSString *title,SEL sel))newItem;

@end
