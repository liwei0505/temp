//
//  LoginViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/18.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LoginViewController.h"
#import "SDAutoLayout.h"
#import "LoginViewModel.h"
#import "RegisterViewController.h"
#import "RegisterResetPasswordViewController.h"
#import "LZGlobalUtil.h"
#import "PostLoginThread.h"
#import "LZTabBarViewController.h"
#import "ReactiveObjC.h"
#import "PostPictureThread.h"

#define SPACE_TO_VIEW 40
#define BUTTON_CORNER_RADIUS 20


@interface LoginViewController ()

@property (nonatomic, strong) LoginViewModel *myViewModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
    self.navigationController.navigationBar.translucent = NO;
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initUI {
    self.imageViewHead = [[UIImageView alloc] initWithFrame:CGRectMake(SCR_W / 2 - 30, 30, 60, 60)];
    self.imageViewHead.image = [UIImage imageNamed:@""];
    [self.imageViewHead.layer setMasksToBounds:YES];
    self.imageViewHead.layer.cornerRadius = self.imageViewHead.bounds.size.width / 2;
    self.imageViewHead.layer.borderWidth = 5.0;
    self.imageViewHead.layer.borderColor = UIColorFromRGB(LZCOLOR_MAIN).CGColor;
    [self.view addSubview:self.imageViewHead];
    self.imageViewHead.backgroundColor = [UIColor greenColor];
    
    
    self.fieldAccount = [[MyCustomTextField alloc] init];
    [self.view addSubview:self.fieldAccount];
    self.fieldAccount.sd_layout
    .topSpaceToView(self.imageViewHead, 20)
    .leftSpaceToView(self.view, SPACE_TO_VIEW)
    .rightSpaceToView(self.view, SPACE_TO_VIEW)
    .heightIs(40);
    self.fieldAccount.layer.cornerRadius = BUTTON_CORNER_RADIUS;
    self.fieldAccount.layer.borderWidth = 2;
    self.fieldAccount.layer.borderColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY).CGColor;
    self.fieldAccount.placeholder = @"邮箱/手机号";
    
    self.fieldPassword = [[MyCustomTextField alloc] init];
    [self.view addSubview:self.fieldPassword];
    self.fieldPassword.sd_layout
    .topSpaceToView(self.fieldAccount, 10)
    .leftEqualToView(self.fieldAccount)
    .rightEqualToView(self.fieldAccount)
    .heightIs(40);
    self.fieldPassword.layer.cornerRadius = BUTTON_CORNER_RADIUS;
    self.fieldPassword.layer.borderWidth = 2;
    self.fieldPassword.layer.borderColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY).CGColor;;
    self.fieldPassword.placeholder = @"密码";
    
    
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnLogin];
    self.btnLogin.sd_layout
    .topSpaceToView(self.fieldPassword, 10)
    .leftEqualToView(self.fieldAccount)
    .rightEqualToView(self.fieldAccount)
    .heightIs(40);
    [self.btnLogin setTitle:@"登陆" forState:UIControlStateNormal];
    [self.btnLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnLogin.titleLabel setFont:[UIFont systemFontOfSize:text_size_large]];
    [self.btnLogin setBackgroundColor:UIColorFromRGB(LZCOLOR_MAIN)];
    self.btnLogin.layer.cornerRadius = BUTTON_CORNER_RADIUS;
    self.btnLogin.layer.borderWidth = 2;
    self.btnLogin.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.btnToReg = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnToReg];
    self.btnToReg.sd_layout
    .topSpaceToView(self.btnLogin, 10)
    .leftSpaceToView(self.view, SPACE_TO_VIEW + 5)
    .widthIs(50)
    .heightIs(20);
    [self.btnToReg setTitle:@"注册" forState:UIControlStateNormal];
    [self.btnToReg setTitleColor:UIColorFromRGB(LZCOLOR_LIGHTBLUE) forState:UIControlStateNormal];
    [self.btnToReg.titleLabel setFont:[UIFont systemFontOfSize:text_size_normal]];
    
    self.btnForgetPsd = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnForgetPsd];
    self.btnForgetPsd.sd_layout
    .topSpaceToView(self.btnLogin, 10)
    .rightSpaceToView(self.view, SPACE_TO_VIEW + 10)
    .widthIs(100)
    .heightIs(20);
    [self.btnForgetPsd setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [self.btnForgetPsd setTitleColor:UIColorFromRGB(LZCOLOR_LIGHTBLUE) forState:UIControlStateNormal];
    [self.btnForgetPsd.titleLabel setFont:[UIFont systemFontOfSize:text_size_normal]];
    
    
    //button事件
    [self.btnLogin addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.btnToReg addTarget:self action:@selector(goToRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.btnForgetPsd addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickLoginBtn {
//    PostPictureThread *thread1 = [[PostPictureThread alloc] initWithMdn:@"1" withPassword:@"1" andLoginWay:@"1"];
//    [thread1 requireonPrev:^{
//        ;
//    } success:^(NSDictionary *response) {
//        ;
//    } unavaliableNetwork:^{
//        ;
//    } timeout:^{
//        ;
//    } exception:^(NSString *message) {
//        ;
//    }];
//    return;

    if ([self checkAccount] == NO) {
        return;
    }
    
    if ([self checkPassword] == NO) {
        return;
    }
    //网络请求登陆
    PostLoginThread *thread = [[PostLoginThread alloc] initWithMdn:@"12345678901" withPassword:@"yaoming" andLoginWay:@"phone"];
    [thread requireonPrev:^{
        NSLog(@"prev");;
    } success:^(NSDictionary *response) {
        NSLog(@"success");
        LZTabBarViewController *viewController = [[LZTabBarViewController alloc] init];
        [self presentViewController:viewController animated:YES completion:nil];
        
    } unavaliableNetwork:^{
        NSLog(@"unavaliableNetwork");;
    } timeout:^{
        NSLog(@"timeout");;
    } exception:^(NSString *message) {
        NSLog(@"exception");;
    }];
    
    
}

- (BOOL)checkAccount {
    TEL_TYPE_NUM type = [LZGlobalUtil checkPhoneNumType:self.fieldAccount.text];
    if (type == TEL_TYPE_NUM_CM || type == TEL_TYPE_NUM_CU || type == TEL_TYPE_NUM_CT) {
        return YES;
    }
    return YES;
}

- (BOOL)checkPassword {
    
    if (self.fieldPassword.text.length < 6 || self.fieldPassword.text.length > 12) {
        return YES;
    }
    return YES;
}

- (void)goToRegister {
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)forgetPassword {
    RegisterResetPasswordViewController *vc = [[RegisterResetPasswordViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
