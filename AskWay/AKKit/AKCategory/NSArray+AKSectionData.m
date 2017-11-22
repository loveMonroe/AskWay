//
//  NSArray+AKSectionData.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "NSArray+AKSectionData.h"

#import <objc/runtime.h>

static const void *kHeaderHeight = "headerHeight";
static const void *kFooterHeight = @"footerHeight";
static const void *kHeaderTitle = @"headerTitle";
static const void *kFooterTitle = @"footerTitle";
static const void *kHeaderData = @"headerData";
static const void *kFooterData = @"footerData";
static const void *kExtend = @"extend";

@implementation NSArray (AKSectionData)

- (CGFloat)headerHeight {
    return [objc_getAssociatedObject(self, kHeaderHeight) floatValue];
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    objc_setAssociatedObject(self, kHeaderHeight, [NSNumber numberWithFloat:headerHeight], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)footerHeight {
    return [objc_getAssociatedObject(self, kFooterHeight) floatValue];
}

- (void)setFooterHeight:(CGFloat)footerHeight {
    objc_setAssociatedObject(self, kFooterHeight, [NSNumber numberWithFloat:footerHeight], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)headerTitle {
    return objc_getAssociatedObject(self, kHeaderTitle);
}

- (void)setHeaderTitle:(NSString *)headerTitle {
    objc_setAssociatedObject(self, kHeaderTitle, headerTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)footerTitle {
    return objc_getAssociatedObject(self, kFooterTitle);
}

- (void)setFooterTitle:(NSString *)footerTitle {
    objc_setAssociatedObject(self, kFooterTitle, footerTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)headerData {
    return objc_getAssociatedObject(self, kHeaderData);
}

- (void)setHeaderData:(id)headerData {
    objc_setAssociatedObject(self, kHeaderData, headerData, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)footerData {
    return objc_getAssociatedObject(self, kFooterData);
}

- (void)setFooterData:(id)footerData {
    objc_setAssociatedObject(self, kFooterData, footerData, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)extend {
    return objc_getAssociatedObject(self, kExtend);
}

- (void)setExtend:(id)extend {
    objc_setAssociatedObject(self, kExtend, extend, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

/**
 配置height和title
 
 @param headerHeight section头视图的高度
 @param footerHeight section尾视图的高度
 @param headerTitle section头视图的title
 @param footerTitle section尾视图的title
 */
+ (instancetype)configArray:(NSMutableArray *)array
               HeaderHeight:(CGFloat)headerHeight
               footerHeight:(CGFloat)footerHeight
                headerTitle:(NSString *)headerTitle
                footerTitle:(NSString *)footerTitle {
    NSMutableArray *sectionarray = [NSMutableArray arrayWithArray:array];
    [sectionarray setHeaderHeight:headerHeight];
    [sectionarray setFooterHeight:footerHeight];
    [sectionarray setHeaderTitle:headerTitle];
    [sectionarray setFooterTitle:footerTitle];
    return sectionarray;
}

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
                 footerData:(id)footerData {
    NSMutableArray *sectionarray = [NSMutableArray arrayWithArray:array];
    [sectionarray setHeaderHeight:headerHeight];
    [sectionarray setFooterHeight:footerHeight];
    [sectionarray setHeaderData:headerData];
    [sectionarray setFooterData:footerData];
    return sectionarray;
}

@end
