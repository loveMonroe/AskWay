//
//  AKDefine.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#ifndef AKDefine_h
#define AKDefine_h

//输出带颜色的日志信息
#if DEBUG
#define DLogAll(type,format,...) NSLog(@"%@ %s+%d " format,type,__func__,__LINE__,##__VA_ARGS__)
#define DLogInfo(format,...) DLogAll(@"",format,##__VA_ARGS__)
#define DLogWarn(format,...) DLogAll(@"‼️",format,##__VA_ARGS__)
#define DLogError(format,...) DLogAll(@"❌",format,##__VA_ARGS__)
#else
#define DLogInfo(format,...)
#define DLogWarn(format,...)
#define DLogError(format,...)
#define NSLog(format,...)
#endif


#endif /* AKDefine_h */
