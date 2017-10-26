//
//  TeamInfoHeaderModel.m
//  MyBasketBall
//
//  Created by lw on 17/1/11.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "TeamHeaderModel.h"

@implementation TeamHeaderModel

- (instancetype)initWithDict:(NSDictionary *)dict {

    if (dict) {
        self.name = [DataUtil stringForKey:@"team_name" inDictionary:dict];
        self.matchNum = [DataUtil numberForKey:@"team_match_num" inDictionary:dict];
        self.memberNum = [DataUtil numberForKey:@"team_member_num" inDictionary:dict];
        self.fansNum = [DataUtil stringForKey:@"team_fans_num" inDictionary:dict];
        self.focus = [DataUtil newBoolForKey:@"focus" inDictionary:dict];
    }
    return self;
}

@end
