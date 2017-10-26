//
//  LZGlobalUtil.m
//  MyBasketBall
//
//  Created by lee on 16/12/6.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LZGlobalUtil.h"

@implementation LZGlobalUtil

#pragma mark -电话号码匹配
+ (TEL_TYPE_NUM) checkPhoneNumType:(NSString *)phoneNum {
    if ([DataUtil isEmptyString:phoneNum]) {
        return TEL_TYPE_NUM_NONE;
    }
    
    {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        /*
         *小灵通 固话
         */
        NSString *PHS_NUM = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
        /*
         *区号+座机号码
         */
        NSString *FIX_NUM = @"^(0[0-9]{2,3})?([2-9][0-9]{6,7})$";
        
        NSPredicate *predCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatchCM = [predCM evaluateWithObject:phoneNum];
        
        NSPredicate *predCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatchCU = [predCU evaluateWithObject:phoneNum];
        
        NSPredicate *predCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatchCT = [predCT evaluateWithObject:phoneNum];
        
        NSPredicate *predPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS_NUM];
        BOOL isMatchPHS = [predPHS evaluateWithObject:phoneNum];
        
        NSPredicate *predFIX = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", FIX_NUM];
        BOOL isMatchFIX = [predFIX evaluateWithObject:phoneNum];
        
        if ( isMatchCM ) {
            return TEL_TYPE_NUM_CM;
            
        } else if ( isMatchCU ) {
            return TEL_TYPE_NUM_CU;
            
        } else if ( isMatchCT ) {
            return TEL_TYPE_NUM_CT;
            
        } else if ( isMatchPHS ) {
            return TEL_TYPE_NUM_PHS;
            
        } else if ( isMatchFIX ) {
            return TEL_TYPE_NUM_FIX;
            
        }   else {
            return TEL_TYPE_NUM_NONE;
        }
        
    }
    
}

@end
