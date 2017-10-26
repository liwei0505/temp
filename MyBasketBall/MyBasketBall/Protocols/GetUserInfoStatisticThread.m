//
//  GetUserInfoStatisticThread.m
//  MyBasketBall
//
//  Created by lw on 17/1/9.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetUserInfoStatisticThread.h"

@implementation GetUserInfoStatisticThread

- (instancetype)initWithUserId:(int)userId {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",PUBLIC_URL,@"/user/userinfo/statistic"];
    [self setUrl:url andTimeout:defaultTimeout];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:userId] forKey:@"userid"];
    self.params = params;
    return self;
    
}

- (void)requireonPrev:(void (^)())prev success:(void (^)(NSDictionary *))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString *))exception {
    
    self.prev = prev;
    self.unavaliableNetwork = unavaliableNetwork;
    self.timout = timeout;
    self.success = success;
    self.exception = exception;
    [self require];
    
}
//TODO: MODEL
- (void)onSuccess:(NSString *)result {
    [super onSuccess:result];
    if (self.success) {
        NSDictionary *dic = [result JSONValue];
        NSInteger code = [DataUtil numberForKey:@"code" inDictionary:dic].integerValue;
        NSString *message = [dic valueForKey:@"message"];
        if (code == 1) {
            NSDictionary *response = [DataUtil dictionaryForKey:@"response" inDictionary:dic];
            NSMutableDictionary *resultDict = [NSMutableDictionary dictionaryWithCapacity:response.count];
            for (NSDictionary *dict in response) {
                
            }
            
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
