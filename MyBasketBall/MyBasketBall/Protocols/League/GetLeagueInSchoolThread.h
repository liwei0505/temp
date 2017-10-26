//
//  GetLeagueInSchoolThread.h
//  MyBasketBall
//
//  Created by lizhe on 16/11/1.
//  Copyright © 2016年 lizhe. All rights reserved.
//


#import "GetHttpThread.h"

@interface GetLeagueInSchoolThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSArray *dic);
@property (nonatomic, copy) void (^exception)(NSString* message);

-(instancetype) initWithSchoolId:(NSInteger)schoolId andLimit:(NSInteger)limit andTicket:(NSInteger)ticket;

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSArray *dic))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;

@end
