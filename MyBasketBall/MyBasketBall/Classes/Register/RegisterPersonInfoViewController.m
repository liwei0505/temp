//
//  RegisterPersonInfoViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterPersonInfoViewController.h"
#import "SDAutoLayout.h"
#import "RegisterTextField.h"
#import "RegisterCommonDef.h"
#import "LZPickerNum.h"
#import "RegisterChooseTextField.h"
@interface RegisterPersonInfoViewController ()
@property (nonatomic, strong) RegisterViewModel *viewModel;

@property (nonatomic, strong) UIImageView   *imageViewHead;
@property (nonatomic, strong) UIButton *btnImageHead;

@property (nonatomic, strong) UIButton *btnChooseMan;
@property (nonatomic, strong) UIButton *btnChooseWoman;

@property (nonatomic, strong) RegisterTextField *fieldNickName;
@property (nonatomic, strong) RegisterTextField *fieldRealName;
@property (nonatomic, strong) RegisterTextField *fieldBirthday;

@property (nonatomic, strong) RegisterChooseTextField *fieldForHeight;
@property (nonatomic, strong) RegisterChooseTextField *fieldForWeight;

@property (nonatomic, strong) UIButton *btnConfirm;
@end

@implementation RegisterPersonInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self setCustomLeftBarButtonItem];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithViewModel:(RegisterViewModel *)viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
        return self;
    }
    return nil;
}

- (void) initUI {
    [self initHead];
    [self initSexChoose];
    [self initTextField];
    [self initChooseViewField];
    [self initConfirmBtn];
}

- (void)initHead {
    self.imageViewHead = [[UIImageView alloc] initWithFrame:CGRectMake(SCR_W / 2 - 30, 30, 60, 60)];
    self.imageViewHead.image = [UIImage imageNamed:@""];
    [self.imageViewHead.layer setMasksToBounds:YES];
    self.imageViewHead.layer.cornerRadius = self.imageViewHead.bounds.size.width / 2;
    self.imageViewHead.layer.borderWidth = 2.0;
    self.imageViewHead.layer.borderColor = UIColorFromRGB(LZCOLOR_MAIN).CGColor;
    [self.view addSubview:self.imageViewHead];
    self.imageViewHead.backgroundColor = [UIColor greenColor];
    
    self.btnImageHead = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnImageHead];
    self.btnImageHead.backgroundColor = [UIColor redColor];
    self.btnImageHead.sd_layout.bottomEqualToView(self.imageViewHead)
    .rightEqualToView(self.imageViewHead)
    .heightIs(20)
    .widthIs(20);
    self.btnImageHead.layer.cornerRadius = self.btnImageHead.bounds.size.width / 2;
    self.btnImageHead.layer.borderWidth = 2.0;
    self.btnImageHead.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.btnImageHead addTarget:self action:@selector(takePhotoForHead) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initSexChoose {
    self.btnChooseMan = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnChooseMan];
    self.btnChooseMan.backgroundColor = [UIColor redColor];
    self.btnChooseMan.sd_layout.topSpaceToView(self.imageViewHead, 20)
    .rightSpaceToView(self.imageViewHead, -20)
    .heightIs(20)
    .widthIs(40);
    self.btnChooseMan.layer.cornerRadius = 10;
    [self.btnChooseMan setTitle:@"男" forState:UIControlStateNormal];
    [self.btnChooseMan addTarget:self action:@selector(chooseSex) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnChooseWoman = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnChooseWoman];
    self.btnChooseWoman.backgroundColor = [UIColor redColor];
    self.btnChooseWoman.sd_layout.topSpaceToView(self.imageViewHead, 20)
    .leftSpaceToView(self.imageViewHead, -20)
    .heightIs(20)
    .widthIs(40);
    self.btnChooseWoman.layer.cornerRadius = 10;
    [self.btnChooseWoman setTitle:@"女" forState:UIControlStateNormal];
    [self.btnChooseWoman addTarget:self action:@selector(chooseSex) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initTextField {
    self.fieldNickName = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldNickName];
    self.fieldNickName.placeholder = @"昵称";
    
    self.fieldRealName = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldRealName];
    self.fieldRealName.placeholder = @"真实姓名";
    
    self.fieldBirthday = [[RegisterTextField alloc]init];
    [self.view addSubview:self.fieldBirthday];
    self.fieldBirthday.placeholder = @"出生年月";
    
    //设置frame
    self.fieldNickName.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW )
    .topSpaceToView(self.btnChooseMan, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
    
    self.fieldRealName.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW)
    .topSpaceToView(self.fieldNickName, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
    
    self.fieldBirthday.sd_layout.leftSpaceToView(self.view, DISTANCE_TO_VIEW)
    .rightSpaceToView(self.view, DISTANCE_TO_VIEW)
    .topSpaceToView(self.fieldRealName, HEIGHT_BETWEEN_VIEWS)
    .heightIs(HEIGHT_VIEWFIELD);
}

- (void)initChooseViewField {
    self.fieldForHeight = [[RegisterChooseTextField alloc] initWithNeedSetTopLine:YES andBottom:YES];
    [self.view addSubview:self.fieldForHeight];
    self.fieldForHeight.sd_layout.topSpaceToView(self.fieldBirthday,DISTANCE_TO_VIEW)
    .leftEqualToView(self.fieldBirthday)
    .rightEqualToView(self.fieldBirthday)
    .heightIs(40);
    self.fieldForHeight.text = @"身高";
    self.fieldForHeight.textColor = [UIColor lightGrayColor];
    
    self.fieldForWeight = [[RegisterChooseTextField alloc] initWithNeedSetTopLine:NO andBottom:YES];
    [self.view addSubview:self.fieldForWeight];
    self.fieldForWeight.sd_layout.topSpaceToView(self.fieldForHeight,0)
    .leftEqualToView(self.fieldForHeight)
    .rightEqualToView(self.fieldForHeight)
    .heightIs(40);
    self.fieldForWeight.text = @"体重";
    self.fieldForWeight.textColor = [UIColor lightGrayColor];

}

- (void)initConfirmBtn {
    self.btnConfirm = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.btnConfirm];
    self.btnConfirm.sd_layout
    .topSpaceToView(self.fieldForWeight, 30)
    .leftEqualToView(self.fieldForWeight)
    .rightEqualToView(self.fieldForWeight)
    .heightIs(40);
    [self.btnConfirm setTitle:@"注册" forState:UIControlStateNormal];
    [self.btnConfirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btnConfirm.titleLabel setFont:[UIFont systemFontOfSize:text_size_large]];
    [self.btnConfirm setBackgroundColor:UIColorFromRGB(LZCOLOR_MAIN)];
    [self.btnConfirm.layer setCornerRadius:20];
    [self.btnConfirm addTarget:self action:@selector(clickConfirmBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickConfirmBtn {
    
}

- (void)chooseSex {
    
}

@end
