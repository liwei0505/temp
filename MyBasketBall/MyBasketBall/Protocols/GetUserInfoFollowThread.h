//
//  GetUserInfoFollowThread.h
//  MyBasketBall
//
//  Created by lw on 17/1/7.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

@interface GetUserInfoFollowThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)();
@property (nonatomic, copy) void (^exception)(NSString* message);

- (instancetype)initWithUserId:(int)userId visitorId:(int)visitorId;
- (void)requireonPrev:(void (^)())prev success:(void (^)(NSString *str))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;

@end
