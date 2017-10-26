//
//  GetTeamInfoStatisticThread.h
//  MyBasketBall
//
//  Created by lw on 17/1/27.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

@interface GetTeamInfoStatisticThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSInteger status, NSDictionary *arr);
@property (nonatomic, copy) void (^exception)(NSString* message);

- (instancetype)initWithTeamId:(int)teamId;
- (void)requireonPrev:(void (^)())prev success:(void (^)(NSInteger status, NSDictionary *dic))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;

@end
