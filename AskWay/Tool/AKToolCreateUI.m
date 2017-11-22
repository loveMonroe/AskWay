//
//  AKToolCreateUI.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKToolCreateUI.h"

@implementation AKToolCreateUI


#pragma mark - 生成一个Label
+ (UILabel *)createLabel:(CGRect)frame title:(NSString *)title superView:(UIView *)superView font:(UIFont *)font textColor:(UIColor *)color
{
    UILabel *oneLabel = [[UILabel alloc]initWithFrame:frame];
    oneLabel.text = title;
    oneLabel.font = font;
    oneLabel.textColor = color;
    [superView addSubview:oneLabel];
    return oneLabel;
}

+ (UILabel *)createLabel:(CGRect)frame title:(NSString *)title superView:(UIView *)superView font:(UIFont *)font textColor:(UIColor *)color textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *oneLabel = [[UILabel alloc]initWithFrame:frame];
    oneLabel.text = title;
    oneLabel.font = font;
    oneLabel.textColor = color;
    oneLabel.textAlignment = textAlignment;
    [superView addSubview:oneLabel];
    return oneLabel;
}

#pragma mark - 生成一个ImageView
+ (UIImageView *)createImageView:(CGRect)frame image:(UIImage *)image superView:(UIView *)superView
{
    UIImageView *ImgView = [[UIImageView alloc]initWithFrame:frame];
    ImgView.image = image;
    [superView addSubview:ImgView];
    return ImgView;
}

#pragma mark - 生成一个UIButton
+ (UIButton *)createUIButton:(CGRect)frame image:(UIImage *)image title:(NSString *)title backgroundColor:(UIColor *)color superView:(UIView *)superView
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.backgroundColor = color;
    [superView addSubview:btn];
    return btn;
}

#pragma mark - 生成一个UITextField
+ (UITextField *)createUITextField:(CGRect)frame placeholder:(NSString *)placeholder superView:(UIView *)superView
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placeholder;
    textField.backgroundColor = [UIColor whiteColor];
    [superView addSubview:textField];
    return textField;
}

#pragma mark - 生成一个UIView
+ (UIView *)createUIView:(CGRect)frame backgroundColor:(UIColor *)color superView:(UIView *)superView
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    [superView addSubview:view];
    return view;
}

#pragma mark - 生成一个UITableView
+ (UITableView *)createTableView:(CGRect)frame rowHeight:(float)h superView:(UIView *)superView delegate:(id)delegate
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    if (h > 0) {
        tableView.rowHeight = h;
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [superView addSubview:tableView];
    return tableView;
}

+ (UITableView *)createTableView:(CGRect)frame rowHeight:(float)h superView:(UIView *)superView delegate:(id)delegate ifGrouped:(BOOL)ifGrouped
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:ifGrouped];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.rowHeight = h;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [superView addSubview:tableView];
    return tableView;
}

+ (UIScrollView *)createScrollView:(CGRect)frame contentSize:(CGSize)size superView:(UIView *)superView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.contentSize = size;
    [superView addSubview:scrollView];
    return scrollView;
}

+ (UISearchBar *)createSearchBar:(CGRect)frame superView:(UIView *)superView delegate:(id)delegate
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 40)];
    searchBar.delegate = delegate;
    [superView addSubview:searchBar];
    return searchBar;
}

@end
