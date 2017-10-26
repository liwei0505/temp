//
//  MatchListModel.h
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MatchTeamModel.h"
@interface MatchListModel : NSObject

@property (nonatomic, strong) NSString *matchId;
@property (nonatomic, strong) NSString *matchAddress;
@property (nonatomic, assign) long long time;
@property (nonatomic, assign) NSInteger isEnd;  //是否已结束
@property (nonatomic, strong) NSMutableArray  *matchTeams;

- (instancetype)initWithDic:(NSDictionary *)dic;

- (NSDictionary *)dictionary;


@end
