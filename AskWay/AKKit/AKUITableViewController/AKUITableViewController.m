//
//  AKUITableViewController.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewController.h"

#import "AKRefreshHeader.h"
#import "AKRefreshFooter.h"

@interface AKUITableViewController ()

@end

@implementation AKUITableViewController

@dynamic viewModel;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.viewModel = [[[self viewModelClass] alloc] init];
        self.viewModel.viewController = self;
    }
    return self;
}

- (Class)viewModelClass {
    return [AKUITableViewModel class];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 0.1)];
    [self.view addSubview:self.tableView];
    
    WEAKSELF
    if ([self tableViewLoadType] & AKUITableViewLoadTypeHeader) {
        self.tableView.mj_header = [AKRefreshHeader headerWithRefreshingBlock:^{
            [weakSelf doTableViewListRequestType:AKRequestRefresh];
        }];
    }
    if ([self tableViewLoadType] & AKUITableViewLoadTypeFooter) {
        self.tableView.mj_footer = [AKRefreshFooter footerWithRefreshingBlock:^{
            [weakSelf doTableViewListRequestType:AKRequestLoadMore];
        }];
    }
}

- (void)doTableViewListRequestType:(AKRequestType)requestType {
    
}

#pragma mark - property

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:[self prefersTableViewStyle]];
        _tableView.delegate = self;
        _tableView.dataSource = self.viewModel;
//        _tableView.backgroundColor = LPColorBackground;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _tableView;
}

- (UITableViewStyle)prefersTableViewStyle {
    return UITableViewStylePlain;
}

- (AKUITableViewLoadType)tableViewLoadType {
    return AKUITableViewLoadTypeNone;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionData = [self.viewModel.mDataArray objectAtIndex:indexPath.section];
    AKUITableViewCellData *cellData = [sectionData objectAtIndex:indexPath.row];
    
    return [tableView lp_calculateCellWithCellData:cellData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSArray *sectionData = [self.viewModel.mDataArray objectAtIndex:section];
    if (sectionData.headerHeight == 0) {
        return CGFLOAT_MIN;
    }
    return sectionData.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    NSArray *sectionData = [self.viewModel.mDataArray objectAtIndex:section];
    if (sectionData.footerHeight == 0) {
        return CGFLOAT_MIN;
    }
    return sectionData.footerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //DLogInfo(@"self.viewModel.mDataArray == %@",self.viewModel.mDataArray);
    NSArray *sectionData = [self.viewModel.mDataArray objectAtIndex:section];
    if (sectionData.headerHeight == 0) {
        return nil;
    }
    
    UIView *_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, sectionData.headerHeight)];
    return _view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    NSArray *sectionData = [self.viewModel.mDataArray objectAtIndex:section];
    if (sectionData.footerHeight == 0) {
        return nil;
    }
    
    UIView *_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, sectionData.footerHeight)];
    return _view;
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
