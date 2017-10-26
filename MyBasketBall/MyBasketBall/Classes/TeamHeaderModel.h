//
//  TeamInfoHeaderModel.h
//  MyBasketBall
//
//  Created by lw on 17/1/11.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamHeaderModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *matchNum;
@property (nonatomic, strong) NSNumber *memberNum;
@property (nonatomic, copy) NSString *fansNum;
@property (nonatomic, copy) NSString *introduction;
@property (nonatomic, assign) BOOL focus;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
