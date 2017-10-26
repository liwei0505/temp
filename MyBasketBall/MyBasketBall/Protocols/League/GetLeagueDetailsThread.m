//
//  GetLeagueDetailsThread.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//
#define kLeagueDetails @"/league/inschool/cell"

#define kLeagueDetailsUrl [NSString stringWithFormat:@"%@%@",PUBLIC_URL,kLeagueDetails]

#import "GetLeagueDetailsThread.h"

@implementation GetLeagueDetailsThread

-(instancetype) initWithLeagueId:(NSString *)leagueId {
    
    [self setUrl:kLeagueDetailsUrl andTimeout:defaultTimeout];
    
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    [params setValue:leagueId forKey:@"leagueid"];
    [params setValue:@"1" forKey:@"userid"];
    self.params=params;
    return self;
}

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary *dic))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception{
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
        
        NSString* message=[dic valueForKey:@"message"];
        
        if( code == 1 ){
        
            NSDictionary *myDic = [DataUtil dictionaryForKey:@"response" inDictionary:dic];
            self.success(myDic);
            
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
