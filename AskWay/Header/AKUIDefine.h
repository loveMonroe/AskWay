//
//  AKUIDefine.h
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#ifndef AKUIDefine_h
#define AKUIDefine_h


#define S_font(n) [UIFont systemFontOfSize:n]
#define SB_font(n) [UIFont boldSystemFontOfSize:n]


#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

/*
 常用颜色
 */
#define AKColor_Title       HEXCOLOR(0x333333)    // 重要标题/文本框已填写内容/正文文字颜色
#define AKColor_IgnoreTitle HEXCOLOR(0x999999)    // 不重要信息/占位提示文字颜色--浅灰色
#define AKColor_Yellow      HEXCOLOR(0xFFAA01)    // 标题之后的提示信息--黄色
#define AKColor_Blue        HEXCOLOR(0x4CA7FF)    // 按钮/分割线 蓝色
#define AKColor_Gray        HEXCOLOR(0xCCCCCC)    // 分割线 灰色

/*
 常用字体
 */
#define AKFontLevel_One     [UIFont systemFontOfSize:18]    // 导航栏标题、底部弹出按钮文字
#define AKFontLevel_Two     [UIFont systemFontOfSize:16]    // 大按钮文字、导航栏按钮文字
#define AKFontLevel_Three   [UIFont systemFontOfSize:15]    // 列表标题、表单文字
#define AKFontLevel_Four    [UIFont systemFontOfSize:14]    // 列表副标题、正文字体、toast提示框文字
#define AKFontLevel_Five    [UIFont systemFontOfSize:13]    // 弹框正文、顶部标签栏文字、搜索框文字、页面文本框文字
#define AKFontLevel_Six     [UIFont systemFontOfSize:12]    // 次要级信息、提示信息、属性
#define AKFontLevel_Seven   [UIFont systemFontOfSize:11]    // 小按钮文字、tabbar文字

#endif /* AKUIDefine_h */
