//
//  ViewModelDefine.h
//  mts-iphone
//
//  Created by lizhe on 16/7/13.
//  Copyright © 2016年 中国电信. All rights reserved.
//

#ifndef ViewModelDefine_h
#define ViewModelDefine_h


typedef NS_ENUM(NSInteger, UIState) {
    UIStateNetWorkPrev = 10000,         //开始网络请求
    UIStateNetWorkSucceed,              //网络请求成功
    UIStateNetWorkUnavaliable,          //网络不可用
    UIStateNetWorkTimeOut,              //网络超时
    UIStateNetWorkException,            //网络异常
    
    UIStateShowHug   =   20000,
    UIStateHideHug   =   20001,
    
    UIStateLocationFaild = 30000,       //定位失败
    UIStateLocationSucceed = 30001,     //定位成功
};



#endif /* ViewModelDefine_h */
