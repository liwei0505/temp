//
//  PostRegisterThread.h
//  basketBallTemplate
//
//  Created by lizhe on 16/10/5.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "PostJsonHttpThread.h"
#define kRegister @"/register/userinfo"
#define kRegisterUrl [NSString stringWithFormat:@"%@%@",PUBLIC_URL,kRegister]

@interface PostRegisterThread : PostJsonHttpThread


@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSDictionary* response ,NSString *token);
@property (nonatomic, copy) void (^exception)(NSString* message);

-(instancetype) initWithMdn:(NSString *)mdn withPassword:(NSString *)password andPasswordAgain:(NSString *)passwordAgain andType:(NSInteger)type;

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary* response,NSString *token))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;


@end
