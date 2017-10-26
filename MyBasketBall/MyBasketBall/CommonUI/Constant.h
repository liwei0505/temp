//
//  Constant.h
//  mts-iphone
//
//  Created by 尹平 on 12-10-31.
//  Copyright (c) 2012年 中国电信. All rights reserved.
//

#ifndef mts_iphone_Constant_h
#define mts_iphone_Constant_h

// 错误码
typedef enum:NSUInteger{
    ErrorCodeForRequestTimeout = 1001, // 请求超时，服务器开小差
    ErrorCodeForOrderSendFailure = 1002, // 参数错误，订单发布失败
    ErrorCodeForFailureButCanContinue = 1003, // 失败但仍可继续
}OrderErrorCode;


typedef NS_ENUM(NSInteger, GetDataOperate) {
    GetDataOperateNone     = 0,     //仅获取数据无其他操作
    GetDataOperateRefresh  = 1,     //刷新
    GetDataOperateLoadMore = 2      //加载更多
};

#define  LEFT_TO_SCREEN 10


/** 屏幕尺寸 */
#define SCR_BOUNDS [UIScreen mainScreen].bounds
/** 屏幕尺寸 */
#define SCR_SIZE [UIScreen mainScreen].bounds.size
/** 屏幕宽度 */
#define SCR_W [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define SCR_H [UIScreen mainScreen].bounds.size.height

/** 顶部导航栏高度 */
#define NAVIGATION_HEIGHT 64.0f
//tabbar高度
#define TABBAR_HEIGHT 49.0f
//segment的高度
#define SEGMENT_HEIGHT 30.0f

#define text_size_huge 22.0f
#define text_size_large 18.0f
#define text_size_between_largeAndNormal 17
#define text_size_normal 16.0f
#define text_size_between_normalAndSmall 15
#define text_size_small 14.0f
#define text_size_between_smallAndSmaller 13
#define text_size_smaller 12.0f
#define text_size_tiny 10.0f

////iOS_fontsize * 72 / 96 = ps_size
////用于导航标题
//#define text_size_36PX 14.0f
////用于标签，列表等大部分重要标题 如标签，标题名称
//#define text_size_34PX 12.75f
////用于大多数文字和按钮
//#define text_size_32PX 12.0f
////用于辅助性文字， 如次级辅助文字
//#define text_size_30PX 11.25f
////主界面模块标题
//#define text_size_28PX 10.5f
////主界面低栏标题
//#define text_size_24PX 9.0f

//16进制GRB值 ，转UIColor
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define normolColor UIColorFromRGB(0xc62828)

#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

//划线颜色
#define Color_Border_Custom [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1]

// 颜色定义
#define LZCOLOR_MAIN (0x224FA2)                       //主色
#define LZCOLOR_BACKGROUND_GRAY (0xEFEFEF)            //背景灰
#define LZCOLOR_RED (0xF76672)                        //红色
#define LZCOLOR_GREEN (0x3AB89C)                      //绿色
#define LZCOLOR_TEXT_BLACK (0x121212)                 //黑色字体
#define LZCOLOR_TEXT_GRAY (0x8B8B8B)                  //灰色字体
#define LZCOLOR_LIGHTBLUE (0x419BF9)                  //浅蓝色
#define LZCOLOR_MORE_RED (0xF8ADC5)                   //粉红色
#define GREENCOLOR                 [UIColor colorWithRed:0.45 green:0.68 blue:0.97 alpha:1.0]
#define BLUECOLOR                 [UIColor colorWithRed:0.45 green:0.68 blue:0.97 alpha:1.0]

//[UIColor colorWithRed:0.2667 green:0.7922 blue:0.6706 alpha:1]
#define GRAYCOLOR                      [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1]

//tableView的背景颜色
#define Color_TableView_Background UIColorFromRGB(0xf3f3f3)
//navigation 的背景颜色
#define Color_Navigation_Background UIColorFromRGB(0xf8f8f8)
//分割线的背景颜色
#define Color_Seperate_Background UIColorFromRGB(0xd7d7d7)

#endif
