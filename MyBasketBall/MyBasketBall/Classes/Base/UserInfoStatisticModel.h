//
//  UserInfoStatisticModel.h
//  MyBasketBall
//
//  Created by lw on 17/1/9.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Diagram : NSObject

@property (nonatomic, assign) double score;
@property (nonatomic, assign) double blackboard;
@property (nonatomic, assign) double assist;
@property (nonatomic, assign) double steal;
@property (nonatomic, assign) double block;

- (instancetype)initWithArray:(NSArray *)array;

@end

@interface MatchModel : NSObject

@property (copy, nonatomic) NSString *date;
@property (copy, nonatomic) NSString *score;
@property (copy, nonatomic) NSString *opponents;
@property (copy, nonatomic) NSString *blackBoard;
@property (copy, nonatomic) NSString *assist;
@property (copy, nonatomic) NSString *steal;
@property (copy, nonatomic) NSString *block;
@property (assign, nonatomic) double shootRate;
@property (assign, nonatomic) double threeRate;
@property (assign, nonatomic) double penaltyRate;

@property (nonatomic, copy) NSString *mistake;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

@interface AverageModel : NSObject

@property (nonatomic, assign) double score;
@property (nonatomic, assign) double blackBoard;
@property (nonatomic, assign) double assist;
@property (nonatomic, assign) double steal;
@property (nonatomic, assign) double block;
@property (assign, nonatomic) double mistake;
@property (assign, nonatomic) double shootRate;
@property (assign, nonatomic) double threeRate;
@property (assign, nonatomic) double penaltyRate;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end

@interface UserInfoStatisticModel : NSObject

@property (nonatomic, strong) Diagram *diagram;
@property (nonatomic, strong) NSMutableArray *matches;
@property (nonatomic, strong) AverageModel *average;
@property (nonatomic, assign) BOOL isShow;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
