//
//  CreateLeagueController.m
//  MyBasketBall
//
//  Created by lw on 17/2/4.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "CreateLeagueController.h"
#import "BattleDetailController.h"

@interface CreateLeagueController ()<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *location;
@property (nonatomic, strong) UITextField *type;
@property (nonatomic, strong) UITextField *begin;
@property (nonatomic, strong) UITextField *end;
@property (nonatomic, strong) UITextField *battleType;
@property (nonatomic, strong) UIPickerView *pickerView;

@end

@implementation CreateLeagueController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    [self prepareRightItem];
    [self preparePickerView];
}

- (void)prepareUI {

    self.title = @"创建联赛";
    float width = self.view.frame.size.width;
    float space = 10;
    float titleWidth = 80;
    float controlLeft = 100;
    NSString *titleColor = @"#000000";
    
    UILabel *nameLabel = [UILabel labelWithTitle:@"名称" size:17 colorString:titleColor];
    nameLabel.frame = CGRectMake(space, 20, titleWidth, 20);
    [self.view addSubview:nameLabel];
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(controlLeft, 20, width-controlLeft, 20)];
    self.nameField.placeholder = @"请输入联赛名称";
    [self.view addSubview:self.nameField];
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame)+5, width, 0.5)];
    [self.view addSubview:line1];
    
    UILabel *location = [UILabel labelWithTitle:@"所在地" size:17 colorString:titleColor];
    location.frame = CGRectMake(space, CGRectGetMaxY(line1.frame)+5, titleWidth, 20);
    [self.view addSubview:location];
    self.location = [[UITextField alloc] initWithFrame:CGRectMake(controlLeft, CGRectGetMaxY(line1.frame)+5, width-controlLeft, 20)];
    
    
    
}

- (void)preparePickerView {
    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, SCR_W, 200)];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.location.inputView = self.pickerView;
    self.type.inputView = self.pickerView;
    self.begin.inputView = self.pickerView;
    self.end.inputView = self.pickerView;
    self.battleType.inputView = self.pickerView;
    
}

- (void)prepareRightItem {
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(create)];
    self.navigationItem.rightBarButtonItem = right;
    
}



- (void)create {
    
    BattleDetailController *battle = [[BattleDetailController alloc] init];
    battle.title = @"一队 VS 二队";
}

@end
