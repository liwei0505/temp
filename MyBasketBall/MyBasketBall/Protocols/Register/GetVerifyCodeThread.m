//
//  GetVerifyCodeThread.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/5.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "GetVerifyCodeThread.h"

@implementation GetVerifyCodeThread
-(instancetype) initWithMdn:(NSString *)mdn{
    
    [self setUrl:kRegisterVerifyCodeUrl andTimeout:defaultTimeout];
    
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    [params setValue:mdn forKey:@"phone"];
    
    self.params=params;
    return self;
}

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSInteger ret))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception{
    self.prev=prev;
    self.unavaliableNetwork=unavaliableNetwork;
    self.timout=timeout;
    self.success=success;
    self.exception=exception;
    [self require];
}
-(void)onPrev{
    [super onPrev];
    if(self.prev){
        self.prev();
    }
}

-(void)onUnavaliableNetwork{
    [super onUnavaliableNetwork];
    if(self.unavaliableNetwork){
        self.unavaliableNetwork();
    }
}

-(void)onSuccess:(NSString *)result{
    [super onSuccess:result];
    if(self.success)
    {
        NSDictionary * dic=[result JSONValue];
        NSInteger ret = [DataUtil numberForKey:@"ret" inDictionary:dic].integerValue;
        self.success(ret);
    }
}

-(void)onTimeout{
    [super onTimeout];
    if(self.timout){
        self.timout();
    }
    
    
}

-(void)exception:(NSInteger) code message:(NSString *) message{
    [super exception:code message:message];
    if(self.exception)
        self.exception(message);
    
}

-(void)onCancelled{
    [super onCancelled];
}

@end
