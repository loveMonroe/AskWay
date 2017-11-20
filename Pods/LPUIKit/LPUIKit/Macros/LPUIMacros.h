//
//  Header.h
//  testRSA
//
//  Created by apple on 2017/1/18.
//  Copyright © 2017年 Damion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NSString+Device.h"

#ifndef LPUIMacros_h
#define LPUIMacros_h

/**
 设备相关
 */
#define iOS7   ([[NSString systemVersion] floatValue] >= 7.0)?YES:NO
#define iOS8   ([[NSString systemVersion] floatValue] >= 8.0)?YES:NO
#define iOS9   ([[NSString systemVersion] floatValue] >= 9.0)?YES:NO
#define iOS10  ([[NSString systemVersion] floatValue] >= 10.0)?YES:NO
#define iOS11  ([[NSString systemVersion] floatValue] >= 11.0)?YES:NO

#define iPhone6P ([[NSString deviceVersion] isEqualToString:@"iPhone 6 Plus"] || [[NSString deviceVersion] isEqualToString:@"iPhone 6s Plus"] || [[NSString deviceVersion] isEqualToString:@"iPhone 7 Plus"])
#define iPhone6 ([[NSString deviceVersion] isEqualToString:@"iPhone 6"] || [[NSString deviceVersion] isEqualToString:@"iPhone 6s"] || [[NSString deviceVersion] isEqualToString:@"iPhone 7"])
#define iPhone5 ([[NSString deviceVersion] rangeOfString:@"iPhone 5"].location != NSNotFound || [[NSString deviceVersion] isEqualToString:@"iPhone SE"])
#define iPhone4 ([[NSString deviceVersion] isEqualToString:@"iPhone 4"])

#define TABBAR_HEIGHT 49
#define NAVIGATION_BAR_HEIGHT 64
#define SYS_STATUSBAR_HEIGHT 20         // 标准系统状态栏高度
#define HOTSPOT_STATUSBAR_HEIGHT 20     // 热点栏高度

#define APP_STATUSBAR_HEIGHT    [UIApplication sharedApplication].statusBarFrame.size.height // 状态栏高度
#define IS_HOTSPOT_CONNECTED    (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?1:0) //是否存在热点栏
#define STATUSBAR_EXTRA_HEIGHT  ([UIApplication sharedApplication].statusBarFrame.size.height-SYS_STATUSBAR_HEIGHT)

#define screenWidth  [UIScreen mainScreen].bounds.size.width
#define screenHeight ([UIScreen mainScreen].bounds.size.height-IS_HOTSPOT_CONNECTED*20)
#define screenScale  [UIScreen mainScreen].scale

#define ScreenWidth_3_5 320.0
#define ScreenWidth_4   320.0
#define ScreenWidth_4_7 375.0
#define ScreenWidth_5_5 414.0

/*
 block self
 */
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

/*
 常用颜色
 */
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define LPColorClear        HEXACOLOR(0,0)       // 透明色
#define LPColorWhite        HEXCOLOR(0xFFFFFF)   // 白色
#define LPColorBrand        HEXCOLOR(0xe85352)   // 品牌色，用于重要性信息颜色，按钮和部分icon颜色--红色
#define LPColorLink         HEXCOLOR(0x576b95)   // 链接的颜色--蓝色
#define LPColorSuccess      HEXCOLOR(0x56c538)   // 成功状态颜色--绿色
#define LPColorError        HEXCOLOR(0xfa5454)   // 错误提示，失败状态颜色--红色
#define LPColorTitle        HEXCOLOR(0x333333)   // 重要标题/文本框已填写内容/正文文字颜色
#define LPColorSubTitle     HEXCOLOR(0x666666)   // 次要级信息文字颜色
#define LPColorIgnoreTitle  HEXCOLOR(0x999999)   // 不重要信息/占位提示文字颜色--
#define LPColorLine         HEXCOLOR(0xEAEAEA)   // 分割线颜色
#define LPColorBackground   HEXCOLOR(0xF3F3F3)   // 页面背景色

#define LPColorGoldenButton         HEXCOLOR(0xC4A475)          //按钮颜色（金色）
#define LPColorGoldenUnavailablen   HEXACOLOR(0xC4A475,0.5)   //不可点击按钮颜色（金色）
#define LPColorDarkgoldenrod        HEXCOLOR(0xC5AF7F)          //暗金色
#define LPColorMineHeader           HEXCOLOR(0x464C5B)          //我的页面header背景色
#define LPColorBorderColor          HEXCOLOR(0xCFCFCF)          //功能管理页面边框

#define LPColorAvailableButton      HEXCOLOR(0x515260)          //按钮颜色
#define LPColorUnavailableButton    HEXACOLOR(0x515260,0.5)     //按钮不可点击颜色
#define LPColorHighlightButton      HEXCOLOR(0x464754)          //按钮高亮颜色
#define LPColorHighlightTextButton  HEXCOLOR(0xDADADA)          //按钮高亮字体颜色

#define LPColorRead                 HEXCOLOR(0xc5c5c5)          //标为已读（已读）
#define LPColorUnread               HEXCOLOR(0xff5353)          //标为已读（未读）
#define LPColorRedTip               HEXCOLOR(0xcc0000)          //红色提示文字颜色
#define LPColorButtonSelected       HEXCOLOR(0xDBDBDB)          //自定义按钮点击颜色


/*
 常用字体
 */
#define LPFontLevel_One     [UIFont systemFontOfSize:18]    // 导航栏标题、底部弹出按钮文字
#define LPFontLevel_Two     [UIFont systemFontOfSize:16]    // 大按钮文字、导航栏按钮文字
#define LPFontLevel_Three   [UIFont systemFontOfSize:15]    // 列表标题、表单文字
#define LPFontLevel_Four    [UIFont systemFontOfSize:14]    // 列表副标题、正文字体、toast提示框文字
#define LPFontLevel_Five    [UIFont systemFontOfSize:13]    // 弹框正文、顶部标签栏文字、搜索框文字、页面文本框文字
#define LPFontLevel_Six     [UIFont systemFontOfSize:12]    // 次要级信息、提示信息、属性
#define LPFontLevel_Seven   [UIFont systemFontOfSize:11]    // 小按钮文字、tabbar文字

/*
 间距
 */
#define LPSpaceHorizontalEdge               12.0    // 水平方向，与屏幕的间距
#define LPSpaceCellControlsVerticalEdge     10.0    // 垂直方向，cell上控件的间距
#define LPSpaceCellHeadImageRightEdge        8.0    // 水平方向，cell上与头像右边的间距
#define LPSpaceCellIconImageRightEdge       12.0    // 水平方向，cell上与icon图片右边的间距
#define LPSpaceViewVerticalEdge             12.0    // 垂直方向，视图之间的间距

#endif
