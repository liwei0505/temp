//
//  TeamMemberModel.h
//  MyBasketBall
//
//  Created by lw on 17/2/2.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamMemberModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *position;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
