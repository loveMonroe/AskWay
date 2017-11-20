//
//  LPLimitTextField.h
//  WSXDM
//
//  Created by wangshen on 17/2/17.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import <UIKit/UIKit.h>




typedef NS_ENUM(NSInteger, LPLimitTextFieldType) {
    LPLimitTextFieldTypeByLength,  //按字符串的长度
    LPLimitTextFieldTypeByDoubleByte //按双字节字符的长度  汉字属于双字节
};

typedef NS_ENUM(NSInteger, LPLimitInputType) {
    LPLimitInputTypeNone = 0,  //无限制输入
    LPLimitInputTypeNoEmoji = 1 , //除emoji外 都可以输入
    LPLimitInputTypeNumber = 2 , //只能输入数字
    LPLimitInputTypeCharater = 3 , //只能输入字母
    LPLimitInputTypeDecimalNumber = 4, //只能输入 数字或者小数点
    LPLimitInputTypeNumberCharater = 5, //只能输入数字和字母
    LPLimitInputTypeCustom = 6  //输入规则可自定义 通过customRegular属性 去设置
};



//支持汉字输入 预输入
@interface LPLimitTextField : UITextField


/**
 输入框 限制字节的类型  默认是 LPLimitTextFieldTypeByLength
 */
@property (nonatomic, assign) LPLimitTextFieldType limitType;

/**
 当前输入框的输入类型 默认LPLimitInputTypeNone
 */
@property (nonatomic, assign) LPLimitInputType inputType;

/**
 需要限制的长度 默认是 0 无限制
 */
@property (nonatomic, assign) NSInteger limitCount;

/**
 自定义的输入规则
 */
@property (nonatomic, copy) NSString *customRegular;



/**
 构造器方法
 
 @param limitType 输入框的限制类型
 @param limitCount 长度限制
 @return self
 */
+ (instancetype)limitTextFieldWithFrame:(CGRect )frame
                              limitType:(LPLimitTextFieldType )limitType
                             limitCount:(NSInteger )limitCount;



@end
