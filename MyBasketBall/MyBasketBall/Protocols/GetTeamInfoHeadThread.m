//
//  GetTeamInfoHeadThread.m
//  MyBasketBall
//
//  Created by lw on 17/1/11.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetTeamInfoHeadThread.h"

@implementation GetTeamInfoHeadThread

- (instancetype)initWithUserId:(int)userId teamId:(int)teamId {
    
    NSString *url = [NSString stringWithFormat:@"%@%@",PUBLIC_URL,@"/team/teaminfo/head"];
    [self setUrl:url andTimeout:defaultTimeout];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:userId] forKey:@"userid"];
    [params setObject:[NSNumber numberWithInt:teamId] forKey:@"teamid"];
    self.params = params;
    return self;
}

- (void)requireonPrev:(void (^)())prev success:(void (^)(NSInteger, NSDictionary *))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString *))exception {
    
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
        if (code == 1) {
            NSDictionary *dict = [DataUtil dictionaryForKey:@"response" inDictionary:dic];
            self.success(code, dict);
        } else {
            self.success(code, nil);
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
