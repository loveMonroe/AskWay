//
//  AKEnumDefine.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#ifndef AKEnumDefine_h
#define AKEnumDefine_h

// 本地数据请求方式
typedef NS_ENUM(NSUInteger, AKDataLoadType) {
    AKDataLoadFirst,    // 首次加载
    AKDataLoadPullDown, // 下拉刷新
    AKDataLoadPullUp    // 上拉刷新
};

typedef NS_ENUM(NSInteger, TabBarIndex) {
    TabBarHome = 0,
    TabBarMentor = 1,
    TabBarMine = 2,
};

typedef NS_ENUM(NSInteger, AKLoadNoDataType) {
    AKLoadNoDataNone = 0,
};

// 网络请求类型
typedef NS_ENUM(NSInteger , AKRequestType) {
    //加载更多
    AKRequestLoadMore = 0,
    //重新加载
    AKRequestRefresh = 1,
};

typedef NS_ENUM(NSInteger, AKQuesResultType) {
    //待解答
    AKQuesResultTypeUndo = 0,
    //解答中
    AKQuesResultTypeIng = 1,
    //已完成
    AKQuesResultTypeFinish = 2,
    //已关闭
    AKQuesResultTypeClosed = 3,
};


#endif /* AKEnumDefine_h */
