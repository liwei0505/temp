//
//  GetUserInfoJoinThread.m
//  MyBasketBall
//
//  Created by lw on 17/1/8.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetUserInfoJoinThread.h"
#import "UserInfoJoinModel.h"

@implementation GetUserInfoJoinThread

- (instancetype)initWithUserId:(int)userId {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",PUBLIC_URL,@"/user/userinfo/join"];
    [self setUrl:url andTimeout:defaultTimeout];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:userId] forKey:@"userid"];
    self.params = params;
    return self;
    
}

- (void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary *))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString *))exception {
    
    self.prev = prev;
    self.unavaliableNetwork = unavaliableNetwork;
    self.timout = timeout;
    self.success = success;
    self.exception = exception;
    [self require];
    
}

- (void)onSuccess:(NSString *)result {
    [super onSuccess:result];
    if (self.success) {
        NSDictionary *dic = [result JSONValue];
        NSInteger code = [DataUtil numberForKey:@"code" inDictionary:dic].integerValue;
        NSString *message = [dic valueForKey:@"message"];
        if (code == 1) {
            NSDictionary *response = [DataUtil dictionaryForKey:@"response" inDictionary:dic];
            NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithCapacity:response.count];
            //球队
            NSArray *team = [DataUtil arrayForKey:@"team" inDictionary:response];
            
            NSMutableArray *teamArray = [NSMutableArray arrayWithCapacity:team.count];
            for (NSDictionary *dict in team) {
                UserInfoJoinModel *model = [[UserInfoJoinModel alloc] initWithDict:dict];
                [teamArray addObject:model];
            }
            [resultDict setObject:teamArray forKey:@"team"];
            
            //联赛
            NSArray *league = [DataUtil arrayForKey:@"league" inDictionary:response];
            NSMutableArray *leagueArray = [NSMutableArray arrayWithCapacity:league.count];
            for (NSDictionary *dict in league) {
                UserInfoJoinModel *model = [[UserInfoJoinModel alloc] initWithDict:dict];
                [leagueArray addObject:model];
            }
            [resultDict setObject:leagueArray forKey:@"league"];
            
            self.success(resultDict);
            
        } else {
            [self exception:0 message:message];
        }
    }
    
}

- (void)onUnavaliableNetwork {
    [super onUnavaliableNetwork];
    if(self.unavaliableNetwork) {
        self.unavaliableNetwork();
    }
}

- (void)onTimeout {
    [super onTimeout];
    if(self.timout) {
        self.timout();
    }
}

- (void)exception:(NSInteger) code message:(NSString *) message {
    [super exception:code message:message];
    if(self.exception) {
        self.exception(message);
    }
}

- (void)onCancelled {
    [super onCancelled];
}


@end
