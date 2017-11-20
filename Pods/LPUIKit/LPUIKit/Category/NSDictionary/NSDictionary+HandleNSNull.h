//
//  NSDictionary+HandleNSNull.h
//  ShuaLian
//
//  Created by EvanCai on 4/30/15.
//  Copyright (c) 2015 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HandleNSNull)

+(NSDictionary *)nullDic:(NSDictionary *)myDic;
+(NSArray *)nullArr:(NSArray *)myArr;
+(NSString *)stringToString:(NSString *)string;
+(NSString *)nullToString;
+(id)changeType:(id)myObj;


/**
 获得布尔值

 @param key 键

 @return 值
 */
- (BOOL)boolForKey:(nonnull NSString *)key;

@end
