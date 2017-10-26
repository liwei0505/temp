//
//  RegisterResetPasswordViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterResetPasswordViewController.h"
#import "RegisterTextField.h"
#import "RegisterCommonDef.h"
#import "SDAutoLayout.h"

@interface RegisterResetPasswordViewController ()

@property (nonatomic, strong) RegisterTextField *fieldPhoneNum;
@property (nonatomic, strong) RegisterTextField *fieldConfirmCode;
@property (nonatomic, strong) RegisterTextField *fieldPassword;
@property (nonatomic, strong) RegisterTextField *fieldPasswordAgain;

@property (nonatomic, strong) UIButton  *btnConfirm;
@property (nonatomic, strong) UIButton  *btnGetCode;

//@property (nonatomic, strong) RegisterPickerTableViewCell

@end

@implementation RegisterResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"重置密码";
    [self setCustomLeftBarButtonItem];
    [self initUI];
    [self initBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.fieldPhoneNum = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldPhoneNum];
    self.fieldPhoneNum.placeholder = @"手机号";
    
    self.fieldConfirmCode = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldConfirmCode];
    self.fieldConfirmCode.placeholder = @"验证码";
    
    self.fieldPassword = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldPassword];
    self.fieldPassword.placeholder = @"密码(6-12位数字或字母)";
    
    self.fieldPasswordAgain = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldPasswordAgain];
    self.fieldPasswordAgain.placeholder = @"再次输入密码";
    
    //设置frame以及frame依赖
    
    self.fieldPhoneNum.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW + 85)
    .topSpaceToView(self.view, HEIGHT_VIEWFIELD)
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
}

- (void)initBtn {
    self.btnConfirm = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnConfirm];
    self.btnConfirm.sd_layout
    .topSpaceToView(self.fieldPasswordAgain, 30)
    .leftEqualToView(self.fieldPasswordAgain)
    .rightEqualToView(self.fieldPasswordAgain)
    .heightIs(40);
    [self.btnConfirm setTitle:@"确定" forState:UIControlStateNormal];
    [self.btnConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnConfirm.titleLabel setFont:[UIFont systemFontOfSize:text_size_large]];
    [self.btnConfirm setBackgroundColor:UIColorFromRGB(LZCOLOR_MAIN)];
    [self.btnConfirm.layer setCornerRadius:20];
    [self.btnConfirm addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
    
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
    
}

- (void)clickConfirmBtn {
    
}

@end
