//
//  GetVerifyCodeThread.h
//  basketBallTemplate
//
//  Created by lizhe on 16/10/5.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "GetHttpThread.h"

#define kRegisterVerifyCode @"/register/verifycode"
#define kRegisterVerifyCodeUrl [NSString stringWithFormat:@"%@%@",PUBLIC_URL,kRegisterVerifyCode]

//#define kRegisterVerifyCodeUrl [[NSString stringWithFormat:@"%@%@",PUBLIC_URL,kRegisterString]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
@interface GetVerifyCodeThread : GetHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSInteger ret);
@property (nonatomic, copy) void (^exception)(NSString* message);

-(instancetype) initWithMdn:(NSString *)mdn;

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSInteger ret))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;
@end
