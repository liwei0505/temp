//
//  PostRegisterThread.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/5.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "PostRegisterThread.h"

@implementation PostRegisterThread


-(instancetype) initWithMdn:(NSString *)mdn withPassword:(NSString *)password andPasswordAgain:(NSString *)passwordAgain andType:(NSInteger)type {
    
    [self setUrl:kRegisterUrl andTimeout:defaultTimeout];
    
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    [params setValue:mdn forKey:@"phone"];
    [params setValue:password forKey:@"passwd1"];
    [params setValue:passwordAgain forKey:@"passwd2"];
    [params setValue:[NSNumber numberWithInteger:type] forKey:@"type"];
    
    
    [params setValue:@"2" forKey:@"verifycode"];
    self.params=params;
    return self;
}

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary* response,NSString *token))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception{
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
        
        NSNumber* num_code=[DataUtil numberForKey:@"code" inDictionary:dic];
        NSInteger code=[num_code integerValue];
        NSString* message=[dic valueForKey:@"message"];
        
        
        
        
        NSString *token = [dic valueForKey:@"token"];
        
        if(code==200){
            NSDictionary * responseDic=[NSDictionary dictionary];
            NSMutableArray *data_arr  = [dic valueForKey:@"data"];
            responseDic = [data_arr firstObject];
            
            self.success(responseDic,token);
            NSLog(@"%@",responseDic);
            
        }else{
            [self exception:0 message:message];
            
        }
        
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
