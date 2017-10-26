//
//  UserInfoStatisticModel.m
//  MyBasketBall
//
//  Created by lw on 17/1/9.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "UserInfoStatisticModel.h"


@implementation Diagram

- (instancetype)initWithArray:(NSArray *)array {

    if (array != nil) {
        NSDictionary *dict1 = array[0];
        float score1 = [DataUtil numberForKey:@"score" inDictionary:dict1].longValue;
        float ratio1 = [DataUtil numberForKey:@"ratio" inDictionary:dict1].longValue;
        self.score = score1 * ratio1;
        
        NSDictionary *dict2 = array[1];
        float score2 = [DataUtil numberForKey:@"blackboard" inDictionary:dict2].longValue;
        float ratio2 = [DataUtil numberForKey:@"ratio" inDictionary:dict2].longValue;
        self.blackboard = score2 * ratio2;
        
        NSDictionary *dict3 = array[2];
        float score3 = [DataUtil numberForKey:@"assist" inDictionary:dict3].longValue;
        float ratio3 = [DataUtil numberForKey:@"ratio" inDictionary:dict3].longValue;
        self.assist = score3 * ratio3;
        
        NSDictionary *dict4 = array[3];
        float score4 = [DataUtil numberForKey:@"steal" inDictionary:dict4].longValue;
        float ratio4 = [DataUtil numberForKey:@"ratio" inDictionary:dict4].longValue;
        self.score = score4 * ratio4;
        
        NSDictionary *dict5 = array[4];
        float score5 = [DataUtil numberForKey:@"block" inDictionary:dict5].longValue;
        float ratio5 = [DataUtil numberForKey:@"ratio" inDictionary:dict5].longValue;
        self.score = score5 * ratio5;
        
    }
    return self;
}

@end

@implementation AverageModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (dict != nil) {
        self.score = [DataUtil numberForKey:@"score" inDictionary:dict].longValue;
        self.blackBoard = [DataUtil numberForKey:@"blackboard" inDictionary:dict].longValue;
        self.assist = [DataUtil numberForKey:@"assist" inDictionary:dict].longValue;
        self.steal = [DataUtil numberForKey:@"steal" inDictionary:dict].longValue;
        self.block = [DataUtil numberForKey:@"block" inDictionary:dict].longValue;
        self.mistake = [DataUtil numberForKey:@"mistake" inDictionary:dict].longValue;
        self.shootRate = [DataUtil numberForKey:@"shootrate" inDictionary:dict].longValue;
        self.threeRate = [DataUtil numberForKey:@"threerate" inDictionary:dict].longValue;
        self.penaltyRate = [DataUtil numberForKey:@"penaltyrate" inDictionary:dict].longValue;
    }
    return self;
}

@end

@implementation MatchModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (dict != nil) {
        self.date = [DataUtil stringForKey:@"date" inDictionary:dict];
        self.score = [DataUtil stringForKey:@"score" inDictionary:dict];
        self.opponents = [DataUtil stringForKey:@"opponents" inDictionary:dict];
        self.blackBoard = [DataUtil stringForKey:@"blackboard" inDictionary:dict];
        self.assist = [DataUtil stringForKey:@"assist" inDictionary:dict];
        self.steal = [DataUtil stringForKey:@"steal" inDictionary:dict];
        self.block = [DataUtil stringForKey:@"block" inDictionary:dict];
        self.mistake = [DataUtil stringForKey:@"mistake" inDictionary:dict];
        self.shootRate = [DataUtil numberForKey:@"shootrate" inDictionary:dict].longValue;
        self.threeRate = [DataUtil numberForKey:@"threerate" inDictionary:dict].longValue;
        self.penaltyRate = [DataUtil numberForKey:@"penaltyrate" inDictionary:dict].longValue;
    }
    return self;
}

@end

@implementation UserInfoStatisticModel

- (instancetype)initWithDict:(NSDictionary *)dict {

    if (dict != nil) {
        NSArray *diagram = [DataUtil arrayForKey:@"diagram" inDictionary:dict];
        self.diagram = [[Diagram alloc] initWithArray:diagram];
        
        NSArray *match = [DataUtil arrayForKey:@"match" inDictionary:dict];
        NSMutableArray *matches = [NSMutableArray arrayWithCapacity:match.count];
        for (NSDictionary *dic in match) {
            MatchModel *model = [[MatchModel alloc] initWithDict:dic];
            [matches addObject:model];
        }
        self.matches = matches;
        
        NSDictionary *average = [DataUtil dictionaryForKey:@"average" inDictionary:dict];
        self.average = [[AverageModel alloc] initWithDict:average];
        
    }
    return self;
}

@end
