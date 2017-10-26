//
//  LZGlobalUtil.h
//  MyBasketBall
//
//  Created by lee on 16/12/6.
//  Copyright © 2016年 lizhe. All rights reserved.
//

typedef NS_ENUM(NSUInteger, TEL_TYPE_NUM) {
    TEL_TYPE_NUM_NONE   = 1,    //非法电话号码
    TEL_TYPE_NUM_CM     = 2,    //中国移动
    TEL_TYPE_NUM_CU     = 3,    //中国联通
    TEL_TYPE_NUM_CT     = 4,    //中国电信
    TEL_TYPE_NUM_PHS    = 5,    //小灵通
    TEL_TYPE_NUM_FIX    = 6     //固定电话
};
#import <Foundation/Foundation.h>

@interface LZGlobalUtil : NSObject

+ (TEL_TYPE_NUM) checkPhoneNumType:(NSString *)phoneNum; //获取电话号码类型

@end
