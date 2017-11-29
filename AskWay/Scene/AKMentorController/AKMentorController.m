//
//  AKMentorController.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKMentorController.h"

@interface AKMentorController ()

@end

@implementation AKMentorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
        
        LPBaseLabel *label = [LPBaseLabel lp_labelWithFrame:CGRectMake(LPSpaceHorizontalEdge, 24, screenWidth - LPSpaceHorizontalEdge*2, 24) text:@"导师" font:SB_font(24) textColor:AKColor_Title];
        [backView addSubview:label];
        
        return backView;
    }
    return nil;
}

#pragma mark - 重写父类方法
- (Class)viewModelClass {
    
    return [AKMentorViewModel class];
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
