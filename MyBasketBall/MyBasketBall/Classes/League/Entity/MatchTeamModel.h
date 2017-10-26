//
//  MatchTeamModel.h
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchTeamModel : NSObject

@property (nonatomic, strong) NSString *teamId;
@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, assign) NSInteger score;

- (instancetype)initWithDic:(NSDictionary *)dic;

- (NSDictionary *)dictionary;

@end
