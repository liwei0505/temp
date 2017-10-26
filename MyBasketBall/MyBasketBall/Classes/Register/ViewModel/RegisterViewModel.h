//
//  RegisterViewModel.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "BaseViewModel.h"

@interface RegisterViewModel : BaseViewModel

- (instancetype)initWithBlock:(BlockNotify )block;

- (BOOL)checkVerifyCode:(NSString *)mdn andCodeString:(NSString *)codeString;

- (void)registerUser:(NSString *)mdn andPassword:(NSString *)password;
@end
