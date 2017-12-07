//
//  AKIAMMentorController.m
//  AskWay
//
//  Created by damion on 2017/11/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKIAMMentorController.h"

#import "AKMyAnswerController.h"
#import "AKMyPurseController.h"
#import "AKMentorCertifyController.h"
#import "AKGoodAtFieldController.h"

@interface AKIAMMentorController ()

@end

@implementation AKIAMMentorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.viewModel createDataSource];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        AKGoodAtFieldController *vc = [[AKGoodAtFieldController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        AKMyAnswerController *vc = [[AKMyAnswerController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        AKMyPurseController *vc = [[AKMyPurseController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UIView *backView = [AKToolCreateUI createUIView:CGRectMake(0, 0, screenWidth, 12) backgroundColor:LPColorWhite superView:nil];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LPSpaceHorizontalEdge, 12- 1/screenScale, screenWidth - LPSpaceHorizontalEdge*2, 1/screenScale)];
        label.backgroundColor = LPColorLine;
        [backView addSubview:label];
        return backView;
    }
    return nil;
}

#pragma mark - 重写父类方法
- (Class)viewModelClass {
    
    return [AKIAMMentorViewModel class];
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
