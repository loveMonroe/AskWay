//
//  AKTabBarController.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKTabBarController.h"



#define TAB_ITEM_COUNT 4    //tab个数
#define TAB_BTN_TAG 1000    //btn tag值 起点
#define BTNWIDTH screenWidth/TAB_ITEM_COUNT //其他按钮的宽度


@interface AKTabBarController () <UITabBarDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIView *cusTabBar; //自定义 tabbar

@end

@implementation AKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _addChildViewControllers];
    [self _addBadgeLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 添加子视图

- (void)_addChildViewControllers {
    
}

- (void)_addBadgeLabels {
    
}

#pragma mark - Action

- (void)btnAction:(UIButton *)sender{
    
    
}

#pragma mark - Public function

- (void)addBadgeString:(NSString *)string withIndex:(NSInteger)index{
    
}

#pragma mark - UITabBarDelegate & UITabBarControllerDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
