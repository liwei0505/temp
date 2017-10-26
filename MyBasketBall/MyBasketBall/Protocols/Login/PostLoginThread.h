//
//  PostLoginThread.h
//  mts-iphone
//
//  Created by 刘超 on 15/11/18.
//  Copyright © 2015年 中国电信. All rights reserved.
//

#import "PostJsonHttpThread.h"
//#import "GetHttpThread.h"
@interface PostLoginThread : PostJsonHttpThread


#define klogin @"/login"
#define kPostLoginUrl [NSString stringWithFormat:@"%@%@",PUBLIC_URL,klogin]

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSDictionary* response);
@property (nonatomic, copy) void (^exception)(NSString* message);
-(instancetype) initWithMdn:(NSString *)mdn withPassword:(NSString *)password andLoginWay:(NSString *)loginWay;

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary* response))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;


@end
