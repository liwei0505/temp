//
//  HttpConstant.h
//  basketBallTemplate
//
//  Created by lizhe on 16/10/5.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#ifndef HttpConstant_h
#define HttpConstant_h


#define defaultTimeout 10



///////////////////////////////////////////
//  说明:使用时,取所需的替换到define 后面即可
//  BASKET_IP_RELEASE
//  BASKET_IP_PRE_RELEASE
//  BASKET_IP_DEBUG_IN_NET
//  BASKET_IP_DEBUG_OUT_NET
//  BASKET_IP_DEBUG_ZHANGYUAN
///////////////////////////////////////////

#define DevelopVersion

#define BASKET_IP_DEBUG_IN_NET

//生产环境 BASKET_IP_RELEASE
#if defined BASKET_IP_RELEASE
#define PUBLIC_URL              @"http://120.76.130.252"

//预发布环境地址 BASKET_IP_PRE_RELEASE
#elif defined BASKET_IP_PRE_RELEASE
#define PUBLIC_URL              @"http://120.76.130.252"

//测试环境内网 BASKET_IP_DEBUG_IN_NET
#elif defined BASKET_IP_DEBUG_IN_NET
#define PUBLIC_URL              @"http://120.76.130.252"

#endif



#endif /* HttpConstant_h */



