//
//  AKUITableViewModel.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKUITableViewModel.h"

#import "AKUITableViewCellData.h"
#import "AKUITableViewCell.h"

#import "AKNetworkService.h"

@implementation AKUITableViewModel

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (!_mDataArray) {
        return 0;
    }
    
    NSInteger count = 0;
    if (_mDataArray.count > 0) {
        for (NSArray* subArray in _mDataArray) {
            count += subArray.count;
        }
    }
    if ([AKNetworkService isNetworkReachability]) {
        [tableView tableViewDisplayWithEmptyType:[self loadNoDataType] target:self.viewController ifNecessaryForRowCount:count];
    }else {
        [tableView tableViewDisplayWithEmptyType:AKLoadNoDataNone target:self.viewController ifNecessaryForRowCount:count];
    }
    
    return _mDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionData = [_mDataArray objectAtIndex:section];
    return sectionData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *sectionData = [_mDataArray objectAtIndex:indexPath.section];
    AKUITableViewCellData *cellData = [sectionData objectAtIndex:indexPath.row];
    
    AKUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData.cellIdentfier];
    if (!cell) {
        cell = [[cellData.className alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellData.cellIdentfier];
    }
    cell.delegate = _viewController;
    [cell bindData:cellData];
    return cell;
}

#pragma mark - PublishMethod

- (AKLoadNoDataType)loadNoDataType {
    return AKLoadNoDataNone;
}

#pragma mark - property

- (NSMutableArray *)mDataArray {
    if (!_mDataArray) {
        _mDataArray = [[NSMutableArray alloc] init];
    }
    return _mDataArray;
    
}

@end
