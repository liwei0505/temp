//
//  CreateTeamController.m
//  MyBasketBall
//
//  Created by lw on 16/12/21.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "CreateTeamController.h"
#import "UILabel+Custom.h"
#import "GetCreateTeamThread.h"
#import "TeamMessageController.h"

@interface CreateTeamController ()<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UITextField *cityText;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) UIPickerView *cityPickerView;

@end

@implementation CreateTeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    [self prepareRightItem];
    [self preparePickerView];
}

- (void)prepareUI {

    self.title = @"创建球队";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.titleLabel.font = [UIFont systemFontOfSize:14];
    [right setTitle:@"创建" forState:UIControlStateNormal];
    right.titleLabel.textColor = [UIColor whiteColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:right];
    self.navigationItem.rightBarButtonItem = item;
    
    float width = self.view.bounds.size.width;
    UILabel *name = [UILabel labelWithTitle:@"队名" size:14 colorString:@"#000000"];
    name.frame = CGRectMake(20, 24, 40, 20);
    [self.view addSubview:name];
    
    self.nameText = [[UITextField alloc] initWithFrame:CGRectMake(80, 24, width - 100, 20)];
    self.nameText.font = [UIFont systemFontOfSize:14];
    self.nameText.placeholder = @"请不要超过10个字";
    self.nameText.delegate = self;
    [self.view addSubview:self.nameText];
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameText.frame)+9, width, 1)];
    topLine.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self.view addSubview:topLine];
    
    UILabel *location = [UILabel labelWithTitle:@"所在地" size:14 colorString:@"#000000"];
    location.frame = CGRectMake(20, CGRectGetMaxY(topLine.frame)+9, 50, 20);
    [self.view addSubview:location];
    
    self.cityText = [[UITextField alloc] initWithFrame:CGRectMake(80, CGRectGetMaxY(topLine.frame)+9, width-100, 20)];
    self.cityText.font = [UIFont boldSystemFontOfSize:14];
    self.cityText.delegate = self;
    [self.view addSubview:self.cityText];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(location.frame)+9, width, 1)];
    bottomLine.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self.view addSubview:bottomLine];

}

- (void)prepareRightItem {

    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)preparePickerView {

    self.cities = [NSArray arrayWithObjects:@"请选择",@"北京",@"天津",@"河北",nil];
    self.cityPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, SCR_W, 200)];
    self.cityPickerView.backgroundColor = [UIColor whiteColor];
    self.cityPickerView.delegate = self;
    self.cityPickerView.dataSource = self;
    self.cityText.inputView = self.cityPickerView;
}

#pragma mark - action

- (void)rightItemClick {

    NSLog(@"跳转球队详情");
    if ([self.nameText.text isEqualToString:@""] || [self.cityText.text isEqualToString:@""]) {
        [self showToast:@"创建信息为空"];
        return;
    }
    
    GetCreateTeamThread *thread = [[GetCreateTeamThread alloc] initWithUserId:1 teamName:self.nameText.text teamAddress:self.cityText.text];
    [thread requireonPrev:^{
        
    } success:^(NSString *string) {
        NSLog(@"%@",string);
        TeamMessageController *team = [[TeamMessageController alloc] init];
        [self.navigationController pushViewController:team animated:YES];
    } unavaliableNetwork:^{
        NSLog(@"unavaliable");
    } timeout:^{
        NSLog(@"timeout");
    } exception:^(NSString *message) {
        NSLog(@"%@",message);
    }];
    
}

#pragma mark - picker view delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.cities.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    return self.view.bounds.size.width;
//}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.cities[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row == 0) {
        self.cityText.text = nil;
    } else {
        self.cityText.text = self.cities[row];
    }
    [self.view endEditing:YES];
}

#pragma mark - textfield delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if (self.nameText == textField) {
        if (textField.text.length < 11) {
            return YES;
        }
    }
    return NO;
}

- (void)tap {
    [self.view endEditing:YES];
}

@end
