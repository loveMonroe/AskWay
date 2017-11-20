//
//  NSString+TypeCheck.h
//  ShuaLian
//
//  Created by 虞谦 on 2017/5/12.
//  Copyright © 2017年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TypeCheck)


/**
 判断字符串是否为空

 @param string 字符串
 @return bool
 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 验证密码合法性，判断是否有非法字符

 @param password 密码
 @return bool
 */
+ (BOOL)isValidatePasswrod:(NSString *)password;

/**
 判断A字符串是否包含B字符串

 @param parentString A字符串
 @param subString B字符串
 @return bool
 */
+ (BOOL)isContainsString:(NSString *)parentString subString:(NSString *)subString;

/**
 判断字符串是否包含emoji表情

 @param string 字符串
 @return bool
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 判断身份证是否合法

 @param value 身份证号码
 @return bool
 */
+ (BOOL)validateIDCardNumber:(NSString *)value;

/**
 判断字符串是否为数字

 @param aString 字符串
 @return bool
 */
+ (BOOL)isNumber:(NSString *)aString;

/**
 判断电话是否手机或者座机

 @param phone 电话号码
 @return bool
 */
+ (BOOL)isPhoneNumber:(NSString*)phone;

/**
 判断字符串是数字或字母

 @param aString 字符串
 @return bool
 */
+ (BOOL)isLetterOrNumber:(NSString *)aString;

@end
