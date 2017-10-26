//
//  MatchListModel.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MatchListModel.h"

@implementation MatchListModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (dic != nil) {
        self.matchId = [DataUtil stringForKey:@"matchid" inDictionary:dic];
        self.matchAddress = [DataUtil stringForKey:@"match_address" inDictionary:dic];
        self.time = [DataUtil numberForKey:@"match_time" inDictionary:dic].longLongValue;
        self.isEnd = [DataUtil numberForKey:@"is_end" inDictionary:dic].integerValue;
        self.matchTeams = [[NSMutableArray alloc] init];
        NSArray *array = [DataUtil arrayForKey:@"matches" inDictionary:dic];
        for (NSDictionary *myDic in array) {
            MatchTeamModel *team = [[MatchTeamModel alloc] initWithDic:myDic];
            if (team != nil) {
                [self.matchTeams addObject:team];
            }
        }
        
    }
    return self;
}

- (NSDictionary *)dictionary {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    return dic;
}

@end
