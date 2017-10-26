//
//  CreateTeamThread.m
//  MyBasketBall
//
//  Created by lw on 17/1/3.
//  Copyright © 2017年 lizhe. All rights reserved.
//
#import "GetCreateTeamThread.h"

@implementation GetCreateTeamThread

- (instancetype)initWithUserId:(int)userId teamName:(NSString *)name teamAddress:(NSString *)address {
    
    NSString *createTeamUrl = [NSString stringWithFormat:@"%@%@",PUBLIC_URL,@"/team/create"];
    [self setUrl:createTeamUrl andTimeout:defaultTimeout];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:userId] forKey:@"userid"];
    [params setObject:name forKey:@"team_name"];
    [params setObject:address forKey:@"team_address"];
    self.params = params;
    return self;
}

- (void)requireonPrev:(void (^)())prev success:(void (^)(NSString *string))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString *message))exception {

    self.prev = prev;
    self.unavaliableNetwork = unavaliableNetwork;
    self.timout = timeout;
    self.success = success;
    self.exception = exception;
    [self require];
    
}

- (void)onSuccess:(NSString *)result {
    [super onSuccess:result];
    if (self.success) {
        NSDictionary *dic = [result JSONValue];
        NSInteger code = [DataUtil numberForKey:@"code" inDictionary:dic].integerValue;
        NSString *message = [dic valueForKey:@"message"];
        if (code == 1) {
            self.success(message);
        } else {
            [self exception:0 message:message];
        }
    }
}

- (void)onUnavaliableNetwork {
    [super onUnavaliableNetwork];
    if(self.unavaliableNetwork) {
        self.unavaliableNetwork();
    }
}

- (void)onTimeout {
    [super onTimeout];
    if(self.timout) {
        self.timout();
    }
}

- (void)exception:(NSInteger) code message:(NSString *) message {
    [super exception:code message:message];
    if(self.exception) {
        self.exception(message);
    }
}

- (void)onCancelled {
    [super onCancelled];
}

@end
