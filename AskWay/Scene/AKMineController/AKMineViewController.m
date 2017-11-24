//
//  AKMineViewController.m
//  AskWay
//
//  Created by damion on 2017/11/23.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMineViewController.h"

#import "AKIAMMentorController.h"

@interface AKMineViewController ()

@end

@implementation AKMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"哇哇哇";
    [self lp_setupNavRightItemWithTitle:@"设置" action:@selector(_gotoSettingPage:)];
    
    [self.viewModel createDataSource];
    [self.tableView reloadData];
}

#pragma mark - UI and Action

- (void)_gotoSettingPage:(id)sender {
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        AKIAMMentorController *vc = [[AKIAMMentorController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - 重写父类方法
- (Class)viewModelClass {
    
    return [AKMineViewModel class];
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
