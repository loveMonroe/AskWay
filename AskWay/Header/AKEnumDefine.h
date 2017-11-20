//
//  AKEnumDefine.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#ifndef AKEnumDefine_h
#define AKEnumDefine_h

// 数据请求方式
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


#endif /* AKEnumDefine_h */
