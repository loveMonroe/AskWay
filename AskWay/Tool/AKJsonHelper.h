//
//  AKJsonHelper.h
//  AskWay
//
//  Created by 郭天际 on 2018/1/6.
//  Copyright © 2018年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKJsonHelper : NSObject

/**
 *  参数转平级jsonstring
 *
 *  @param objects 参数数组
 *  @param keys    参数名数组
 *
 *  @return jsonString
 */
+ (NSString *)jsonStringNormalFromObjects:(NSArray *)objects andKeys:(NSArray *)keys;

/**
 *  参数转平级jsonstring
 *
 *  @param object 参数 and key
 *
 *  @return jsonString
 */
+ (NSString *)jsonStringNormalFromValuesAndKeys:(id)object, ...NS_REQUIRES_NIL_TERMINATION;

+ (id)objectFromJSONString:(NSString *)string;
+ (id)mutableObjectFromJSONString:(NSString *)string;
+ (id)objectFromJSONData:(NSData *)data;
+ (id)mutableObjectFromJSONData:(NSData *)data;

+ (NSString *)stringWithObject:(id)object;
+ (NSData *)dataWithObject:(id)object;

@end

//category，like JSONKit
@interface NSString (AKJSONDeserializing)
- (id)objectFromJSONString;
- (id)mutableObjectFromJSONString;
@end

@interface NSData (AKJSONDeserializing)
// The NSData MUST be UTF8 encoded JSON.
- (id)objectFromJSONData;
- (id)mutableObjectFromJSONData;
@end


@interface NSString (AKJSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

@interface NSArray (AKJSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

@interface NSDictionary (AKJSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end
