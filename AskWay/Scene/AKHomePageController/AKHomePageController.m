//
//  AKHomePageController.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKHomePageController.h"

#import "AKMessageCenterController.h"
#import "AKPublishController.h"
#import "AKNavigationController.h"

@interface AKHomePageController ()

@end

@implementation AKHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self lp_setupNavLeftItemWithTitle:@"消息" action:@selector(_gotoMessageCenter:)];
    [self lp_setupNavRightItemWithTitle:@"发布" action:@selector(_gotoPublishPage:)];
}

#pragma mark - UI and Action

- (void)_gotoMessageCenter:(id)sender {
    
    AKMessageCenterController *vc = [[AKMessageCenterController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)_gotoPublishPage:(id)sender {
    
    AKNavigationController *vc = [[AKNavigationController alloc] initWithRootViewController:[[AKPublishController alloc] init]];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
