//
//  RegisterViewModel.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterViewModel.h"
#import "GetVerifyCodeThread.h"
#import "PostRegisterThread.h"
@implementation RegisterViewModel

- (instancetype)initWithBlock:(BlockNotify )block {
    if (self = [super init]) {
        self.BlockUIChange = block;
    }
    return self;
}

- (BOOL)checkVerifyCode:(NSString *)mdn andCodeString:(NSString *)codeString; {
    GetVerifyCodeThread *thread = [[GetVerifyCodeThread alloc] initWithMdn:mdn];
    [thread requireonPrev:^{
        ;
    } success:^(NSInteger ret) {
        ;
    } unavaliableNetwork:^{
        ;
    } timeout:^{
        ;
    } exception:^(NSString *message) {
        ;
    }];
    
    return YES;
}

- (void)registerUser:(NSString *)mdn andPassword:(NSString *)password {
    
}

@end
