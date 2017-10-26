//
//  GetUserInfoBattleThread.m
//  MyBasketBall
//
//  Created by lw on 17/1/7.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "GetUserInfoBattleThread.h"
#import "UserInfoBattleModel.h"

@implementation GetUserInfoBattleThread

- (instancetype)initWithUserId:(int)userId {

    NSString *url = [NSString stringWithFormat:@"%@%@",PUBLIC_URL,@"/user/userinfo/battle"];
    [self setUrl:url andTimeout:defaultTimeout];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[NSNumber numberWithInt:userId] forKey:@"userid"];
    self.params = params;
    return self;

}

- (void)requireonPrev:(void (^)())prev success:(void (^)(NSArray *))success unavaliableNetwork:(void (^)())unavaliableNetwork timeout:(void (^)())timeout exception:(void (^)(NSString *))exception {

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
            NSArray *arr = [DataUtil arrayForKey:@"response" inDictionary:dic];
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:arr.count];
            for (NSDictionary *dict in arr) {
                UserInfoBattleModel *model = [[UserInfoBattleModel alloc] initWithDict:dict];
                [array addObject:model];
            }
            self.success(array);
            
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
