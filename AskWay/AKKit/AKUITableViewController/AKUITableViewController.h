//
//  AKUITableViewController.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKRefreshViewController.h"

#import "AKUITableViewModel.h"
#import "AKUITableViewCell.h"

typedef NS_ENUM(NSInteger, AKUITableViewLoadType) {
    AKUITableViewLoadTypeNone = 0,          //不添加下拉刷新和上拉加载
    AKUITableViewLoadTypeHeader = 1<<0,     //下拉刷新
    AKUITableViewLoadTypeFooter = 1<<1,     //上拉加载
};

@interface AKUITableViewController <T:AKUITableViewModel *> : AKRefreshViewController <AKUITableViewModel *><UITableViewDelegate, AKUITableViewCellDelegate>

/**
 tableView
 */
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) T viewModel;

/**
 计算高度的cell
 */
@property (strong, nonatomic) NSMutableDictionary *screenCells;

/**
 设置UITableViewStyle，default is UITableViewStylePlain
 
 @return UITableViewStyle
 */
- (UITableViewStyle)prefersTableViewStyle;

/**
 获取ViewModel的类名
 
 @return viewModel类名
 */
- (Class)viewModelClass;

/**
 配置tableView是否支持下拉刷新、上拉加载
 
 @return 支持的类型
 */
- (AKUITableViewLoadType)tableViewLoadType;

/**
 请求列表数据
 
 @param requestType 请求方式是下拉刷新还是上拉加载
 */
- (void)doTableViewListRequestType:(AKRequestType)requestType;

@end
