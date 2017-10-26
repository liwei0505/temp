//
//  TeamGloryModel.m
//  MyBasketBall
//
//  Created by lw on 17/2/3.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "TeamGloryModel.h"

@implementation TeamGloryModel

- (instancetype)initWithDict:(NSDictionary *)dict {

    if (dict != nil) {
        self.name = [DataUtil stringForKey:@"league_name" inDictionary:dict];
        self.year = [DataUtil stringForKey:@"year" inDictionary:dict];
        self.glory = [DataUtil stringForKey:@"glory" inDictionary:dict];
    }
    return self;
}


@end
