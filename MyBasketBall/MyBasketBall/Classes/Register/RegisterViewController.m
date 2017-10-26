//
//  RegisterViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTextField.h"
#import "SDAutoLayout.h"

#import "RegisterCommonDef.h"
#import "PostRegisterThread.h"
#import "GetVerifyCodeThread.h"
#import "AFNetworking.h"

@interface RegisterViewController ()

@property (nonatomic, strong) RegisterTextField *fieldPhoneNum;
@property (nonatomic, strong) RegisterTextField *fieldConfirmCode;
@property (nonatomic, strong) RegisterTextField *fieldPassword;
@property (nonatomic, strong) RegisterTextField *fieldPasswordAgain;

@property (nonatomic, strong) UIButton  *btnGetCode;
@property (nonatomic, strong) UIButton  *btnRegister;

@property (nonatomic, strong) UILabel   *labelTitle;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"注册";
    
    [self initUI];
    [self setCustomLeftBarButtonItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    //初始化设置属性
    self.labelTitle = [[UILabel alloc] init];
    [self.view addSubview:self.labelTitle];
    self.labelTitle.text = @"请输入要注册的信息";
    self.labelTitle.textColor = UIColorFromRGB(LZCOLOR_MAIN);
    self.labelTitle.font = [UIFont systemFontOfSize:text_size_large];
    self.labelTitle.textAlignment = NSTextAlignmentCenter;
    //    self.labelTitle.backgroundColor = [UIColor redColor];
    
    self.fieldPhoneNum = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldPhoneNum];
    self.fieldPhoneNum.placeholder = @"手机号";
    self.fieldPhoneNum.keyboardType = UIKeyboardTypePhonePad;
    //    self.fieldPhoneNum.clearButtonMode = UITextFieldViewModeAlways;
    
    self.fieldConfirmCode = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldConfirmCode];
    self.fieldConfirmCode.placeholder = @"验证码";
    self.fieldConfirmCode.keyboardType = UIKeyboardTypePhonePad;
    
    self.fieldPassword = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldPassword];
    self.fieldPassword.placeholder = @"密码(6-12位数字或字母)";
    self.fieldPassword.secureTextEntry = YES;
    
    self.fieldPasswordAgain = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldPasswordAgain];
    self.fieldPasswordAgain.placeholder = @"再次输入密码";
    self.fieldPasswordAgain.secureTextEntry = YES;
    
    //设置frame以及frame依赖
    self.labelTitle.sd_layout.topSpaceToView(self.view, 30)
    .leftSpaceToView(self.view, 60)
    .rightSpaceToView(self.view, 60)
    .heightIs(50);
    
    self.fieldPhoneNum.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW + 85)
    .topSpaceToView(self.labelTitle, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
    
    self.fieldConfirmCode.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW)
    .topSpaceToView(self.fieldPhoneNum, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
    
    self.fieldPassword.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW)
    .topSpaceToView(self.fieldConfirmCode, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
    
    self.fieldPasswordAgain.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW)
    .topSpaceToView(self.fieldPassword, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
    
    //button
    self.btnRegister = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnRegister];
    self.btnRegister.sd_layout
    .topSpaceToView(self.fieldPasswordAgain, 30)
    .leftEqualToView(self.fieldPasswordAgain)
    .rightEqualToView(self.fieldPasswordAgain)
    .heightIs(40);
    [self.btnRegister setTitle:@"注册" forState:UIControlStateNormal];
    [self.btnRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnRegister.titleLabel setFont:[UIFont systemFontOfSize:text_size_large]];
    [self.btnRegister setBackgroundColor:UIColorFromRGB(LZCOLOR_MAIN)];
    [self.btnRegister.layer setCornerRadius:20];
    [self.btnRegister addTarget:self action:@selector(clickRegister) forControlEvents:UIControlEventTouchUpInside];
    
    //获取验证码
    self.btnGetCode = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnGetCode];
    self.btnGetCode.sd_layout
    .bottomEqualToView(self.fieldPhoneNum)
    .leftSpaceToView(self.fieldPhoneNum,5)
    .widthIs(80)
    .heightIs(30);
    [self.btnGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.btnGetCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnGetCode.titleLabel setFont:[UIFont systemFontOfSize:text_size_small]];
    [self.btnGetCode setBackgroundColor:UIColorFromRGB(LZCOLOR_MAIN)];
    [self.btnGetCode.layer setCornerRadius:10];
    [self.btnGetCode addTarget:self action:@selector(clickGetCode) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickGetCode {
    GetVerifyCodeThread *thread = [[GetVerifyCodeThread alloc] initWithMdn:@"15901116062"];
    [thread requireonPrev:^{
        ;
    } success:^(NSInteger ret) {
        NSLog(@"ret:%ld",(long)ret);
    } unavaliableNetwork:^{
        ;
    } timeout:^{
        ;
    } exception:^(NSString *message) {
        ;
    }];
    
}

- (void)clickRegister {
//    NSString *url = @"http://127.0.0.1/Users/mac/Documents/wb";
    //NSString *url = @"http://120.76.130.252/home/webroot/curry/application/views/data/head";
    //    [self uploadimgWithurl:url image:[UIImage imageNamed:@"工作上报_03"] fileName:@"test1" success:^(id responseObject) {
    //        NSLog(@"hahaha");
    //    } fail:^{
    //        NSLog(@"NNONO");
    //    }];
    //
    //
    //return;
    PostRegisterThread *thread = [[PostRegisterThread alloc] initWithMdn:self.fieldPhoneNum.text withPassword:self.fieldPassword.text andPasswordAgain:self.fieldPasswordAgain.text andType:1];
    [thread requireonPrev:^{
        [self showHud:@"注册中..."];
    } success:^(NSDictionary *response, NSString *token) {
        [self hideHud];
    } unavaliableNetwork:^{
        [self hideHud];
    } timeout:^{
        [self hideHud];
    } exception:^(NSString *message) {
        [self hideHud];
    }];
    
}

- (BOOL)checkLegal {
    
    
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //    [self.fieldPhoneNum resignFirstResponder];
    UITouch *touch = [touches anyObject];
    if (![touch.view isKindOfClass: [UITextField class]] || ![touch.view isKindOfClass: [UITextView class]]) {
        [self.view endEditing:YES];
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    }
}

- (void)uploadimgWithurl:(NSString *)urlStr image:(UIImage *)image fileName:(NSString *)fileName success:(void (^)(id responseObject))success fail:(void (^)())fail
{
    //需要传递的参数,jason格式
    NSDictionary *parameter = @{@"Driverid": @"10000"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:urlStr parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
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
        [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"file1" fileName:fileName mimeType:@"image/png"];
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
