//
//  AKRequest.h
//  AskWay
//
//  Created by 郭天际 on 2018/1/6.
//  Copyright © 2018年 sky. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@class AKRequest;

typedef void(^AKRequestSuccessCompletionBlock)(__kindof AKRequest *request);
typedef void(^AKRequestFailureCompletionBlock)(__kindof AKRequest *request);

@protocol AKRequestDelegate <NSObject>

@optional

- (void)requestAKFinished:(__kindof AKRequest *)request;
- (void)requestAKFailed:(__kindof AKRequest *)request;
- (void)clearCurrentRequest;

@end

@interface AKRequest : YTKRequest

/// block回调
- (void)startWithDataCompletionBlockWithSuccess:(nullable AKRequestSuccessCompletionBlock)success
                                        failure:(nullable AKRequestFailureCompletionBlock)failure;

- (void)setDataCompletionBlockWithSuccess:(nullable AKRequestSuccessCompletionBlock)success
                                  failure:(nullable AKRequestFailureCompletionBlock)failure;

- (void)startRequest;

/**
 显示加载框(加载过程中，允许交互，点击导航栏上按钮)
 
 @param text 显示的text
 */
- (void)showAnimatedView:(NSString *)text;

/**
 显示加载框
 
 @param text 显示的text
 @param allowInteraction 是否允许交互
 */
- (void)showAnimatedView:(NSString *)text allowInteraction:(BOOL)allowInteraction;

- (NSString *)rsaStringFromValuesAndKeys:(id)object, ...NS_REQUIRES_NIL_TERMINATION;
- (NSString *)rsaStringFromValidDic:(NSDictionary *)dic;

@property (nonatomic, copy, nullable) NSString *jsonModelName;

@property (nonatomic, weak, nullable) id <AKRequestDelegate> AKRequestDelegate;

@property (nonatomic, copy, nullable) AKRequestSuccessCompletionBlock successDataCompletionBlock;

@property (nonatomic, copy, nullable) AKRequestFailureCompletionBlock failureDataCompletionBlock;

/// data包含code、data、msg
@property (nonatomic, strong, readonly, nullable) id akResponseData;

/// 只包含data的内容
@property (nonatomic, strong, readonly, nullable) id akResponseDic;

/// 转成jsonmodel
@property (nonatomic, strong, nullable) id akResponseModel;

@property (nonatomic, readonly) NSInteger akResponseCode;

@property (nonatomic, strong, readonly, nullable) NSError *akResponseError;

@end

NS_ASSUME_NONNULL_END
