//
//  GetLeagueDetailsThread.h
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

@interface GetLeagueDetailsThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSDictionary *dic);
@property (nonatomic, copy) void (^exception)(NSString* message);

-(instancetype) initWithLeagueId:(NSString *)leagueId;

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary *dic))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;

@end
