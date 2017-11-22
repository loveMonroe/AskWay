//
//  AKToolCreateUI.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKToolCreateUI : NSObject

/**
 创建一个Label
 
 @param frame 设置Label的Frame
 @param title 设置Label的text
 @param superView 设置Label的superView
 @param font 设置Label字体大小
 @param color 设置字体颜色
 @return label
 */
+ (UILabel *)createLabel:(CGRect)frame title:(NSString *)title superView:(UIView *)superView font:(UIFont *)font textColor:(UIColor *)color;

/**
 创建一个Label
 
 @param frame 设置Label的Frame
 @param title 设置Label的text
 @param superView 设置Label的superView
 @param font 设置Label字体大小
 @param color 设置字体颜色
 @param textAlignment 设置文字对齐方式
 @return label
 */
+ (UILabel *)createLabel:(CGRect)frame title:(NSString *)title superView:(UIView *)superView font:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment;

/**
 创建一个ImageView
 
 @param frame 设置ImageView的frame
 @param image 设置ImageView的图片
 @param superView 设置ImageView的superView
 @return imageView
 */
+ (UIImageView *)createImageView:(CGRect)frame image:(UIImage *)image superView:(UIView *)superView;

/**
 创建一个Button
 
 @param frame 设置Button的frame
 @param image 设置Button的图片
 @param title 设置Button的title
 @param color 设置Button的背景色
 @param superView 设置Button的superView
 @return button
 */
+ (UIButton *)createUIButton:(CGRect)frame image:(UIImage *)image title:(NSString *)title backgroundColor:(UIColor *)color superView:(UIView *)superView;

/**
 创建一个TextField
 
 @param frame 设置TextField的frame
 @param placeholder 设置TextField的placeholder
 @param superView 设置textField的superView
 @return textField
 */
+ (UITextField *)createUITextField:(CGRect)frame placeholder:(NSString *)placeholder superView:(UIView *)superView;

/**
 创建一个UIView
 
 @param frame 设置UIView的frame
 @param color 设置UIView的背景色
 @param superView 设置UIView的superView
 @return view
 */
+ (UIView *)createUIView:(CGRect)frame backgroundColor:(UIColor *)color superView:(UIView *)superView;

/**
 创建一个TableView
 
 @param frame 设置TableView的frame
 @param h 设置TableView的rowHeight
 @param superView 设置TableView的superView
 @param delegate 设置TableView的delegate
 @return tableView
 */
+ (UITableView *)createTableView:(CGRect)frame rowHeight:(float)h superView:(UIView *)superView delegate:(id)delegate;

/**
 创建一个TableView
 
 @param frame 设置TableView的frame
 @param h 设置TableView的rowHeight
 @param superView 设置TableView的superView
 @param delegate 设置TableView的delegate
 @param ifGrouped 设置TableView的style
 @return tabelView
 */
+ (UITableView *)createTableView:(CGRect)frame rowHeight:(float)h superView:(UIView *)superView delegate:(id)delegate ifGrouped:(BOOL)ifGrouped;

/**
 创建一个ScrollView
 
 @param frame 设置ScrollView的frame
 @param size 设置ScrollView的contentSize
 @param superView 设置ScrollView的superView
 @return scrollView
 */
+ (UIScrollView *)createScrollView:(CGRect)frame contentSize:(CGSize)size superView:(UIView *)superView;

/**
 创建一个SearchBar
 
 @param frame 设置SearchBar的frame
 @param superView 设置SearchBar的superView
 @param delegate 设置SearchBar的delegate
 @return searchBar
 */
+ (UISearchBar *)createSearchBar:(CGRect)frame superView:(UIView *)superView delegate:(id)delegate;

@end
