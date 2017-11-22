//
//  AKSettingController.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKSettingController.h"

@interface AKSettingController () <AKUISystemCellDelegate>

@end

@implementation AKSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"设置";
    
    [self.viewModel createDataSource];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - AKUISystemCellDelegate

- (void)systemCell:(AKUISystemCell *)systemCell switchOn:(BOOL)switchOn {
    
}

#pragma mark - 重写父类方法
- (Class)viewModelClass {
    
    return [AKSettingViewModel class];
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
