//
//  LoginViewController.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/18.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "BaseViewController.h"
#import "MyCustomTextField.h"

@interface LoginViewController : BaseViewController

@property (nonatomic, strong) MyCustomTextField   *fieldAccount;
@property (nonatomic, strong) MyCustomTextField   *fieldPassword;

@property (nonatomic, strong) UIImageView   *imageViewHead;
@property (nonatomic, strong) UIButton      *btnLogin;
@property (nonatomic, strong) UIButton      *btnToReg;
@property (nonatomic, strong) UIButton      *btnForgetPsd;

@property (nonatomic, strong) UILabel       *labelShowOtherLogin;

@end
