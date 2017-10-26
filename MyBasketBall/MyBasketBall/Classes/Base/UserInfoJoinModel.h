//
//  UserInfoJoinModel.h
//  MyBasketBall
//
//  Created by lw on 17/1/8.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoJoinModel : NSObject

@property (nonatomic, copy) NSString *teamId;
@property (nonatomic, copy) NSString *teamName;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
