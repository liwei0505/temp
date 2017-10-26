//
//  LeagueListModel.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/23.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LeagueListModel.h"

@implementation LeagueListModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (dic != nil) {
        self.leagueId = [DataUtil stringForKey:@"league_id" inDictionary:dic];
        self.leagueName = [DataUtil stringForKey:@"league_name" inDictionary:dic];
        self.leagueType = [DataUtil numberForKey:@"league_type" inDictionary:dic].integerValue;
        self.leagueIntroduce = [DataUtil stringForKey:@"league_introduction" inDictionary:dic];
        self.teamNum = [DataUtil numberForKey:@"league_team_num" inDictionary:dic].integerValue;
        self.leagueMatchNum = [DataUtil numberForKey:@"league_match_num" inDictionary:dic].integerValue;
        self.leagueFinishNum = [DataUtil numberForKey:@"league_match_finish_num" inDictionary:dic].integerValue;
        self.process = [DataUtil numberForKey:@"process" inDictionary:dic].integerValue;
        self.fansNum = [DataUtil numberForKey:@"league_fans_num" inDictionary:dic].integerValue;
        self.startTime = [DataUtil numberForKey:@"league_start_time" inDictionary:dic].longLongValue;
        self.endTime = [DataUtil numberForKey:@"league_end_time" inDictionary:dic].longLongValue;
        self.ticket = [DataUtil numberForKey:@"ticket" inDictionary:dic].integerValue;
        
    }
    return self;
}

- (NSDictionary *)dictionary {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    return dic;
}

@end
