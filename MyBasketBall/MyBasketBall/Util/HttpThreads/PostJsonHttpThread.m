//
//  PostJsonHttpThread.m
//  mts-iphone
//
//  Created by tyl on 16/8/4.
//  Copyright (c) 2016年 中国电信. All rights reserved.
//

#import "PostJsonHttpThread.h"
#import "NSObject+SBJson.h"

@implementation PostJsonHttpThread


-(void)setUrl:(NSString *)url andTimeout:(NSInteger) timeout{
    
    self.url=url;
    self.timeout=timeout;
}





-(void)onPrev{
    [LogUtil write:@"url" value:self.url];
    [LogUtil write:@"params" value:[self.params JSONRepresentation]];
    
}

-(void)onUnavaliableNetwork{
    [LogUtil write:@"excption" value:@"unavaliableNetwork"];
}

-(void)onSuccess:(NSString *)result{
    [LogUtil write:@"result" value:result];
}

-(void)onTimeout{
    [LogUtil write:@"excption" value:@"timeout"];
}

-(void)exception:(NSInteger) code message:(NSString *) message{
    [LogUtil write:@"excption" value:message];
    
}

-(void)onCancelled{
    
    
}

-(void)require{
    [self onPrev];
    //    self.task=nil;
    //检测网络
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusUnknown:
                [self onUnavaliableNetwork];
                break;
            default:
                [self http];
                break;
        }
        
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}


-(void)cancel{
    if(self.task){
        [self.task cancel];
        [self onCancelled];
    }
}


-(void)http{
    
    AFHTTPSessionManager  *sessionManager = [AFHTTPSessionManager manager];
    
    //https 证书认证 创建securityPolicy
    //    sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    //    [sessionManager.requestSerializer setValue:[self getHelpToken] forHTTPHeaderField:@"Authorization"];
    
//    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //设置超时时间
    [sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    if (self.timeout>0) {
        sessionManager.requestSerializer.timeoutInterval = self.timeout;
    }
    [sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    
    self.task = [sessionManager POST:self.url parameters:self.params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        [self onSuccess:result];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSHTTPURLResponse* response=task.response;
        NSString* str_error=[NSString stringWithFormat:@"%@",error];
        [LogUtil write:@"exception" value:str_error];
        
        if(error.code==-ErrorCodeForRequestTimeout)
        {
            [self onTimeout];
        }
        else{
            [self exception:response.statusCode message:str_error];
        }
        
    }];
    
}

- (void)uploadimgWithurl:(NSString *)urlStr image:(UIImage *)image fileName:(NSString *)fileName success:(void (^)(id responseObject))success fail:(void (^)())fail
{
    NSString *url = @"http://120.76.130.252:8000/image";
    
    //需要传递的参数,jason格式
    NSDictionary *parameter = @{@"id": @"15652352290",
                                @"type":@"register"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /*文件命名参考代码
         // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
         // 要解决此问题，
         // 可以在上传时使用当前的系统事件作为文件名
         NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
         // 设置时间格式
         formatter.dateFormat = @"yyyyMMddHHmmss";
         NSString *str = [formatter stringFromDate:[NSDate date]];
         NSString *newfileName = [NSString stringWithFormat:@"%@.png", str];
         */
        [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"data" fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"progress:%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success:%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    
    //        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //        [manager POST:urlStr parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    //            /*文件命名参考代码
    //             // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
    //             // 要解决此问题，
    //             // 可以在上传时使用当前的系统事件作为文件名
    //             NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //             // 设置时间格式
    //             formatter.dateFormat = @"yyyyMMddHHmmss";
    //             NSString *str = [formatter stringFromDate:[NSDate date]];
    //             NSString *newfileName = [NSString stringWithFormat:@"%@.png", str];
    //             */
    //            [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"file" fileName:fileName mimeType:@"image/png"];
    //        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //            if (success) {
    //                //NSLog(@"success\n");
    //                success(responseObject);
    //            }
    //        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //            if (fail) {
    //                //NSLog(@"fail\n");
    //                fail();
    //            }
    //        }];
}



@end
