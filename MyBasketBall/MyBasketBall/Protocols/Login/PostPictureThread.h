//
//  PostPictureThread.h
//  basketBallTemplate
//
//  Created by lizhe on 16/10/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "PostJsonHttpThread.h"

@interface PostPictureThread : PostJsonHttpThread

@property (nonatomic, copy) void (^prev)();
@property (nonatomic, copy) void (^unavaliableNetwork)();
@property (nonatomic, copy) void (^timout)();
@property (nonatomic, copy) void (^success)(NSDictionary* response);
@property (nonatomic, copy) void (^exception)(NSString* message);

-(instancetype) initWithMdn:(NSString *)mdn withPassword:(NSString *)password andLoginWay:(NSString *)loginWay;

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary* response))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception;



@end
