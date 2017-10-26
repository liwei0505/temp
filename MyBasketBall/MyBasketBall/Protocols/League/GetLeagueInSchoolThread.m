//
//  GetLeagueInSchoolThread.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/1.
//  Copyright © 2016年 lizhe. All rights reserved.
//
#define kLeagueInSchool @"/league/inschool/cells"

#define kLeagueInSchoolUrl [NSString stringWithFormat:@"%@%@",PUBLIC_URL,kLeagueInSchool]

#import "GetLeagueInSchoolThread.h"

@implementation GetLeagueInSchoolThread
-(instancetype) initWithSchoolId:(NSInteger)schoolId andLimit:(NSInteger)limit andTicket:(NSInteger)ticket{
    
    [self setUrl:kLeagueInSchoolUrl andTimeout:defaultTimeout];
    
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    [params setValue:[NSNumber numberWithInteger:schoolId] forKey:@"schoolid"];
    [params setValue:[NSNumber numberWithInteger:limit] forKey:@"num"];

    [params setValue:[NSNumber numberWithInteger:ticket] forKey:@"ticket"];

    
    self.params=params;
    return self;
}

-(void)requireonPrev:(void (^)())prev success:(void (^)(NSArray *array))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString* message))exception{
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
//          NSDictionary * response = [DataUtil dictionaryForKey:@"response" inDictionary:dic];
            NSArray *array = [DataUtil arrayForKey:@"response" inDictionary:dic];
            self.success(array);
            NSLog(@"%@",dic);
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
