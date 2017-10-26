//
//  LeagueListModel.h
//  basketBallTemplate
//
//  Created by lizhe on 16/10/23.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeagueListModel : NSObject

@property (nonatomic, strong) NSString *leagueId;       //联赛id
@property (nonatomic, strong) NSString *leagueName;     //联赛名称
@property (nonatomic, assign) NSInteger leagueType;     //联赛赛制
@property (nonatomic, strong) NSString *leagueIntroduce;//联赛介绍
@property (nonatomic, assign) NSInteger teamNum;        //球队数量
@property (nonatomic, assign) NSInteger leagueMatchNum; //比赛数量
@property (nonatomic, assign) NSInteger leagueFinishNum;//比赛完成数量
@property (nonatomic, assign) NSInteger process;        //联赛进程
@property (nonatomic, assign) NSInteger fansNum;        //联赛粉丝数量
@property (nonatomic, assign) long long startTime;      //联赛开始时间
@property (nonatomic, assign) long long endTime;        //联赛结束时间
@property (nonatomic, assign) NSInteger ticket;         //联赛

- (instancetype)initWithDic:(NSDictionary *)dic;

- (NSDictionary *)dictionary;

@end
