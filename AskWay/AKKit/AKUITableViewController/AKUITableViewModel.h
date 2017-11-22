//
//  AKUITableViewModel.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKViewModel.h"

/**
 列表分页请求回调
 
 @param success 是否成功
 @param loadFinish 是否全部请求完成
 @param data 数据
 @parma error 错误信息
 */
typedef void(^CompleteListBlock)(BOOL success,BOOL loadFinish,id data, NSError *error);

@interface AKUITableViewModel : AKViewModel <UITableViewDataSource>

/**
 关联的viewController
 */
@property (nonatomic, weak) id viewController;

/**
 tableView数据源
 */
@property (nonatomic, strong) NSMutableArray *mDataArray;

/**
 没有数据时的显示
 
 @return 没有数据时的显示
 */
- (AKLoadNoDataType)loadNoDataType;

@end
