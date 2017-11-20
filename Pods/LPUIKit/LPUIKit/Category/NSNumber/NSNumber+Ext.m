//
//  NSNumber+Ext.m
//  ShuaLian
//
//  Created by gcyang on 16/5/10.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import "NSNumber+Ext.h"

#import "NSDate+Utils.h"

@implementation NSNumber (Ext)

- (NSDate *)dateValue:(BOOL)isMillisecond {
    return [NSDate dateWithTimeIntervalSince1970:isMillisecond?self.doubleValue/1000:self.doubleValue];
}

- (NSString *)stringDateValue {
    if (self.doubleValue<=0) {
        return @"";
    }
    NSDate *date = [self dateValue:NO];
    return [date dateStringFull];
}

- (NSString *)stringDateForMillisecond {
    if (self.doubleValue<=0) {
        return @"";
    }
    NSDate *date = [self dateValue:YES];
    return [date dateStringFull];
}

- (NSString *)priceValue {
    if (self.longValue == 0) {
        return @"";
    }else {
        long cent = self.longValue%100;
        if (cent == 0) {//没有小数
            return [NSString stringWithFormat:@"%ld",self.longValue/100];
        }else if (cent%10>0) {//两位小数
            return [NSString stringWithFormat:@"%.2f",self.longValue/100.0];
        }else {//一位小数
            return [NSString stringWithFormat:@"%.1f",self.longValue/100.0];
        }
    }
}

- (NSString *)timeIntervalStringSince1970:(BOOL)millisecond {
    if (millisecond) {
        return @(self.doubleValue/1000).stringValue;
    }
    return self.stringValue;
}

@end
