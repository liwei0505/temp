//
//  CreateTeamThread.h
//  MyBasketBall
//
//  Created by lw on 17/1/3.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

@interface GetCreateTeamThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSString *string);
@property (nonatomic, copy) void (^exception)(NSString* message);

- (instancetype)initWithUserId:(int)userId teamName:(NSString *)name teamAddress:(NSString *)address;
- (void)requireonPrev:(void (^)())prev success:(void (^)(NSString *string))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString *message))exception;

@end
