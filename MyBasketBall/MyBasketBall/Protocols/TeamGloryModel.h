//
//  TeamGloryModel.h
//  MyBasketBall
//
//  Created by lw on 17/2/3.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamGloryModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *glory;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
