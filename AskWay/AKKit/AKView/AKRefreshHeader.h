//
//  AKRefreshHeader.h
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

extern CGFloat const AKRefreshHeaderHeight;

@interface AKRefreshHeader : MJRefreshHeader

/**
 结束时候没有延迟时间
 */
@property (nonatomic, assign) BOOL noEnddelayTime;

/**
 *  创建header
 *
 *  @param refreshingBlock     刷新回调
 *
 *  @return header对象
 */
+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@end
