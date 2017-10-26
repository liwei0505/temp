//
//  PostPictureThread.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "PostPictureThread.h"

@implementation PostPictureThread
-(instancetype) initWithMdn:(NSString *)mdn withPassword:(NSString *)password andLoginWay:(NSString *)loginWay{
    
    [self setUrl:@"http://120.76.130.252:8000/image" andTimeout:defaultTimeout];
    
    NSMutableDictionary* params=[NSMutableDictionary dictionary];
    [params setValue:@"register" forKey:@"type"];
    [params setValue:[NSNumber numberWithInteger:15652352290] forKey:@"id"];
    UIImage *image = [UIImage imageNamed:@"工作上报_03"];
    NSData *data = UIImagePNGRepresentation(image);
    NSString * str  = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    [params setValue:str forKey:@"data"];
    
    
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
        
        NSInteger type = [DataUtil numberForKey:@"type" inDictionary:dic].integerValue;
        
        NSString* message=[dic valueForKey:@"message"];
        
        if( type == 10002 ){
            NSDictionary * responseDic=[NSDictionary dictionary];
            NSMutableArray *data_arr  = [dic valueForKey:@"data"];
            responseDic = [data_arr firstObject];
            
            self.success(dic);
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
