//
//  UIMenuItem+Additions.m
//  ShuaLian
//
//  Created by odyang on 16/8/5.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import "UIMenuItem+Additions.h"

@implementation UIMenuItem (Additions)

+ (instancetype (^)(NSString *, SEL))newItem {
    return ^id(NSString *title,SEL sel) {
        return [[self.class alloc] initWithTitle:title action:sel];
    };
}

@end
