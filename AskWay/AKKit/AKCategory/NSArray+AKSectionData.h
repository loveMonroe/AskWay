//
//  NSArray+AKSectionData.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AKSectionData)

/**
 section头视图的高度，default is 0
 */
@property (nonatomic, assign) CGFloat headerHeight;

/**
 section尾视图的高度，default is 0
 */
@property (nonatomic, assign) CGFloat footerHeight;

/**
 section头视图的title
 */
@property (nonatomic, copy) NSString *headerTitle;

/**
 section尾视图的title
 */
@property (nonatomic, copy) NSString *footerTitle;

/**
 section头视图中的数据
 */
@property (nonatomic, strong) id headerData;

/**
 section尾视图中的数据
 */
@property (nonatomic, strong) id footerData;

/**
 扩展
 */
@property (nonatomic, strong) id extend;

/**
 配置height和title
 
 @param headerHeight section头视图的高度
 @param footerHeight section尾视图的高度
 @param headerTitle section头视图的title
 @param footerTitle section尾视图的title
 */
+ (instancetype)configArray:(NSArray*)array
               HeaderHeight:(CGFloat)headerHeight
               footerHeight:(CGFloat)footerHeight
                headerTitle:(NSString *)headerTitle
                footerTitle:(NSString *)footerTitle;

/**
 配置height和data
 
 @param headerHeight section头视图的高度
 @param footerHeight section尾视图的高度
 @param headerData section头视图中的数据
 @param footerData section尾视图中的数据
 */
+ (instancetype)configArray:(NSArray*)array
               HeaderHeight:(CGFloat)headerHeight
               footerHeight:(CGFloat)footerHeight
                 headerData:(id)headerData
                 footerData:(id)footerData;

@end
