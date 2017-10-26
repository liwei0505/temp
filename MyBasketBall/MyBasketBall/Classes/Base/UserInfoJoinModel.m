//
//  UserInfoJoinModel.m
//  MyBasketBall
//
//  Created by lw on 17/1/8.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "UserInfoJoinModel.h"

@implementation UserInfoJoinModel

- (instancetype)initWithDict:(NSDictionary *)dict {

    if (dict) {
        self.teamId = [DataUtil stringForKey:@"teamid" inDictionary:dict];
        self.teamName = [DataUtil stringForKey:@"teamname" inDictionary:dict];
    }
    return self;
}

@end
