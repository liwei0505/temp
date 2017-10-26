//
//  UserInfoBattleModel.m
//  MyBasketBall
//
//  Created by lw on 17/1/7.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "UserInfoBattleModel.h"

@implementation TeamInfo

- (instancetype)initWithDict:(NSDictionary *)dict {

    if (dict) {
        self.teamid = [DataUtil stringForKey:@"teamid" inDictionary:dict];
        self.name = [DataUtil stringForKey:@"name" inDictionary:dict];
        self.score = [DataUtil stringForKey:@"score" inDictionary:dict];
    }
    return self;
}

@end

@implementation UserInfoBattleModel

- (instancetype)initWithDict:(NSDictionary *)dict {

    if (dict) {
        self.time = [DataUtil stringForKey:@"match_time" inDictionary:dict];
        self.status = [DataUtil stringForKey:@"match_status" inDictionary:dict];
        self.focusNum = [DataUtil stringForKey:@"match_focus_num" inDictionary:dict];
        self.address = [DataUtil stringForKey:@"match_address" inDictionary:dict];
        
        NSArray *teams = [DataUtil arrayForKey:@"teaminfo" inDictionary:dict];
        self.teamArray = [NSMutableArray arrayWithCapacity:teams.count];
        for (NSDictionary *team in teams) {
            TeamInfo *info = [[TeamInfo alloc] initWithDict:team];
            [self.teamArray addObject:info];
        }
    }
    return self;
}

@end
