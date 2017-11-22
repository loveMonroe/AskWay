//
//  AKNetworkService.m
//  AskWay
//
//  Created by damion on 2017/11/22.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKNetworkService.h"

#include <arpa/inet.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import <AFNetworking.h>

static AKNetworkService *instance;
static BOOL reachability = YES;

@interface AKNetworkService ()

@end

@implementation AKNetworkService

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self.class alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized (self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return instance;
}

- (void)startMonitoring {
    //增加网络环境变化的检测
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi) {
            //当前连接WIFI或移动数据网络
            reachability = YES;
        }else {
            reachability = NO;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kAKNetworkStatusNotification object:nil];
    }];
    [manager startMonitoring];
    reachability = YES;
}

- (void)stopMonitoring {
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

+ (BOOL)isNetworkReachability {
    return reachability;
}

+ (BOOL)isWiFi {
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

+ (NSArray *)getIPFromAddress:(NSString *)address {
    Boolean result = FALSE;
    CFHostRef hostRef;
    CFArrayRef addresses = NULL;
    
    const char * transmit =[address UTF8String];
    CFStringRef hostNameRef = CFStringCreateWithCString(kCFAllocatorDefault, transmit, kCFStringEncodingASCII);
    
    hostRef = CFHostCreateWithName(kCFAllocatorDefault, hostNameRef);
    if (hostRef) {
        result = CFHostStartInfoResolution(hostRef, kCFHostAddresses, NULL);
        if (result == TRUE) {
            addresses = CFHostGetAddressing(hostRef, &result);
        }
    }
    
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    if(result) {
        struct sockaddr_in* remoteAddr;
        for(int i = 0; i < CFArrayGetCount(addresses); i++) {
            CFDataRef saData = (CFDataRef)CFArrayGetValueAtIndex(addresses, i);
            remoteAddr = (struct sockaddr_in*)CFDataGetBytePtr(saData);
            
            if(remoteAddr != NULL) {
                //获取IP地址
                char ip[255];
                strcpy(ip, inet_ntoa(remoteAddr->sin_addr));
                NSString *ipStr = [NSString stringWithCString:ip encoding:NSUTF8StringEncoding];
                [resultArray addObject:ipStr];
            }
        }
    }
    CFRelease(hostNameRef);
    if (hostRef) {
        CFRelease(hostRef);
    }
    return resultArray;
}


/**
 获取运营商

 @return 运营商名称
 */
- (NSString *)getCarrierName {
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *carrierName = [carrier carrierName];
    return carrierName;
}

@end
