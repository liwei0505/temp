//
//  MatchTeamModel.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MatchTeamModel.h"

@implementation MatchTeamModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (dic != nil) {
        self.teamId = [DataUtil stringForKey:@"team_id" inDictionary:dic];
        self.teamName = [DataUtil stringForKey:@"team_name" inDictionary:dic];
        self.score = [DataUtil numberForKey:@"score" inDictionary:dic].integerValue;
    }
    return self;
}

- (NSDictionary *)dictionary {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    return dic;
}

@end
