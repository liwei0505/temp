//
//  UserInfoBattleModel.h
//  MyBasketBall
//
//  Created by lw on 17/1/7.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamInfo : NSObject

@property (nonatomic, copy) NSString *teamid;   //球队ID
@property (nonatomic, copy) NSString *name;     //球队名字
@property (nonatomic, copy) NSString *score;    //球队得分

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

@interface UserInfoBattleModel : NSObject

@property (nonatomic, copy) NSString *time;     //比赛时间
@property (nonatomic, copy) NSString *status;   //比赛状态
@property (nonatomic, copy) NSString *focusNum; //关注数
@property (nonatomic, copy) NSString *address;  //地址
@property (nonatomic, strong) NSMutableArray *teamArray;


- (instancetype)initWithDict:(NSDictionary *)dict;

@end
