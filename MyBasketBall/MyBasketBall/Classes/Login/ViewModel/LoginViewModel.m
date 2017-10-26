//
//  LoginViewModel.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (instancetype)initWithBlock:(BlockNotify )block {
    if (self = [super init]) {
        self.BlockUIChange = block;
        return self;
    }
    return nil;
}


@end
