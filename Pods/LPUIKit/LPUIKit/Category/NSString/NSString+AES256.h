//
//  NSString+AES256.h
//  ShuaLian
//
//  Created by 虞谦 on 16/5/13.
//  Copyright © 2016年 EvanCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AES256)

/**
 AES256加密数据

 @param key 加密字符串
 @return 加密结果
 */
- (NSString *)aes256_encrypt:(NSString *)key;

/**
 AES256解密数据

 @param key 解密字符串
 @return 解密结果
 */
- (NSString *)aes256_decrypt:(NSString *)key;

@end
