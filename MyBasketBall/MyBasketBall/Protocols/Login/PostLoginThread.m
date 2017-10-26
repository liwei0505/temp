//
//  PostLoginThread.m
//  mts-iphone
//
//  Created by 刘超 on 15/11/18.
//  Copyright © 2015年 中国电信. All rights reserved.
//

#import "PostLoginThread.h"

@implementation PostLoginThread
-(instancetype) initWithMdn:(NSString *)mdn withPassword:(NSString *)password andLoginWay:(NSString *)loginWay{
   
    [self setUrl:kPostLoginUrl andTimeout:defaultTimeout];
    
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    [params setValue:mdn forKey:@"loginid"];
    [params setValue:password forKey:@"passwd"];
    [params setValue:loginWay forKey:@"loginway"];
   
    
    self.params = params;
    return self;
}

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary* response))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception{
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
        
        NSInteger code = [DataUtil numberForKey:@"code" inDictionary:dic].integerValue;
        
        NSInteger message = [DataUtil numberForKey:@"message" inDictionary:dic].integerValue;;
        
        if( code == 1 ){
            if (message == 10002) {
                NSDictionary * responseDic = [DataUtil dictionaryForKey:@"response" inDictionary:dic];
                self.success(responseDic);
                NSLog(@"%@",responseDic);
            }else {
                [self exception:0 message:@"登陆失败"];
            }
            
            
        }else{
            [self exception:0 message:@"登陆失败"];
            
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
