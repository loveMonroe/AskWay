//
//  AKMessageCenterController.m
//  AskWay
//
//  Created by damion on 2017/11/30.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMessageCenterController.h"

@interface AKMessageCenterController ()

@end

@implementation AKMessageCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"消息中心";
    
    [self.viewModel createDataSource];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *backView = [AKToolCreateUI createUIView:CGRectMake(0, 0, screenWidth, 24) backgroundColor:LPColorWhite superView:nil];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LPSpaceHorizontalEdge, 24- 1/screenScale, screenWidth - LPSpaceHorizontalEdge*2, 1/screenScale)];
        label.backgroundColor = LPColorLine;
        [backView addSubview:label];
        return backView;
    }
    return nil;
}

#pragma mark - 重写父类方法
- (Class)viewModelClass {
    
    return [AKMessageCenterViewModel class];
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
