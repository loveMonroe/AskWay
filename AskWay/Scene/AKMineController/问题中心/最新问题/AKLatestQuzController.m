//
//  AKLatestQuzController.m
//  AskWay
//
//  Created by damion on 2017/12/13.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKLatestQuzController.h"

@interface AKLatestQuzController ()

@end

@implementation AKLatestQuzController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.viewModel createDataSource];
    [self.tableView reloadData];
}

#pragma mark - UI and Action


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 重写父类方法
- (Class)viewModelClass {
    
    return [AKLatestQuzViewModel class];
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
