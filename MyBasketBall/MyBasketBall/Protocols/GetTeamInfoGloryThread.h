//
//  GetTeamGloryThread.h
//  MyBasketBall
//
//  Created by lw on 17/2/3.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

@interface GetTeamInfoGloryThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSInteger status, NSArray *arr);
@property (nonatomic, copy) void (^exception)(NSString* message);

- (instancetype)initWithTeamId:(int)teamId;
- (void)requireonPrev:(void (^)())prev success:(void (^)(NSInteger status, NSArray *dic))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;

@end
