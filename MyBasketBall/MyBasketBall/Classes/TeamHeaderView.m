//
//  TeamHeaderView.m
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamHeaderView.h"
#import "UIColor+StringColor.h"
#import "UILabel+Custom.h"
#import "UIButton+Custom.h"

@interface TeamHeaderView()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (nonatomic, strong) UIButton *selectedButton;
@property (strong, nonatomic) UIView *selectedView;

@property (nonatomic, strong) UILabel *teamName;
@property (nonatomic, strong) UILabel *gameCount;
@property (nonatomic, strong) UILabel *memberCount;
@property (nonatomic, strong) UILabel *followCount;

@property (nonatomic, strong) UILabel *introduce;

@end

@implementation TeamHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupHeaderView];
    }
    return self;
}

- (void)setupHeaderView {

    NSString *mainColor = @"#224FA2";
    NSString *textColor = @"#8B8B8B";
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    UIImageView *portraitView = [[UIImageView alloc] initWithFrame:CGRectMake(26, 10, 60, 60)];
    [portraitView setImage:[UIImage imageNamed:@"touxiang"]];
    portraitView.contentMode = UIViewContentModeScaleAspectFill;
    portraitView.layer.masksToBounds = YES;
    portraitView.layer.cornerRadius = 30;
    [self addSubview:portraitView];
    
    UILabel *teamName = [UILabel labelWithTitle:@"队名" size:15.0 colorString:mainColor];
    teamName.frame = CGRectMake(127, 13, width - 127 - 40, 15);
    self.teamName = teamName;
    [self addSubview:self.teamName];
    
//    UILabel *manage = [UILabel labelWithTitle:@"管理" size:12.0 colorString:mainColor];
//    manage.frame = CGRectMake(width - 38, 13, 38, 12);
//    [self addSubview:manage];
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(126, 37, width - 126, 1)];
    topLine.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self addSubview:topLine];
    
    CGFloat subWidth = (width - 126) / 3.0;
    CGFloat subX = 126.0;
    CGFloat subY = CGRectGetMaxY(topLine.frame) + 9;
    
    UILabel *gameCount = [UILabel labelWithTitle:@"-" size:12 colorString:mainColor];
    gameCount.textAlignment = NSTextAlignmentLeft;
    gameCount.frame = CGRectMake(subX, subY, subWidth, 12);
    self.gameCount = gameCount;
    [self addSubview:self.gameCount];
    
    UILabel *memberCount = [UILabel labelWithTitle:@"-" size:12 colorString:mainColor];
    memberCount.textAlignment = NSTextAlignmentLeft;
    memberCount.frame = CGRectMake(subX + subWidth, subY, subWidth, 12);
    self.memberCount = memberCount;
    [self addSubview:self.memberCount];
    
    UILabel *followCount = [UILabel labelWithTitle:@"-" size:12 colorString:mainColor];
    followCount.textAlignment = NSTextAlignmentLeft;
    followCount.frame = CGRectMake(subX + 2*subWidth, subY, subWidth, 12);
    self.followCount = followCount;
    [self addSubview:self.followCount];
    
    CGFloat labelY = CGRectGetMaxY(gameCount.frame) + 6;
    UILabel *gameLabel = [UILabel labelWithTitle:@"比赛" size:12 colorString:textColor];
    gameLabel.textAlignment = NSTextAlignmentLeft;
    gameLabel.frame = CGRectMake(subX, labelY, subWidth, 12);
    [self addSubview:gameLabel];
    
    UILabel *memberLabel = [UILabel labelWithTitle:@"成员" size:12 colorString:textColor];
    memberLabel.textAlignment = NSTextAlignmentLeft;
    memberLabel.frame = CGRectMake(subX + subWidth, labelY, subWidth, 12);
    [self addSubview:memberLabel];
    
    UIButton *button = [UIButton colorButtonWithTitle:@"关注" fontSize:12 titleColor:@"#FFFFFF" backgroundColor:@"#3AB89C"];
    button.frame = CGRectMake(subX + 2*subWidth, labelY - 1, 30, 17);
    [button addTarget:self action:@selector(followTeam) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"已关注" forState:UIControlStateDisabled];
    self.follow = button;
    [self addSubview:self.follow];
   
    UIView *midLine = [[UIView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(gameLabel.frame) + 9, width - 20, 1)];
    midLine.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self addSubview:midLine];
    
    UILabel *introduce = [UILabel labelWithTitle:@"简介" size:12 colorString:mainColor];
    introduce.frame = CGRectMake(19, CGRectGetMaxY(midLine.frame)+8, 40, 12);
    [self addSubview:introduce];
    
    NSString *str = @"球队简介";
    UILabel *content = [UILabel labelWithTitle:str size:12 colorString:textColor];
    content.frame = CGRectMake(21, CGRectGetMaxY(introduce.frame)+7, width - 30, 30);
    self.introduce = content;
    [self addSubview:self.introduce];
    
    UIView *separate = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(content.frame)+13, width, 4)];
    separate.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
    [self addSubview:separate];
    
    CGFloat buttonWidth = self.bounds.size.width / 4.0;
    NSArray *buttonTitles = @[@"动态",@"数据",@"成员",@"荣耀"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * buttonWidth, height - 40, buttonWidth, 40);
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [button setTitleColor:[UIColor ms_colorWithHexString:@"#8B8B8B"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor ms_colorWithHexString:@"#224FA2"] forState:UIControlStateSelected];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTag:i];
        [button addTarget:self action:@selector(headerButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        if (!i) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
    UIView *selected = [[UIView alloc] initWithFrame:CGRectMake(0, height - 3, buttonWidth, 3)];
    selected.backgroundColor = [UIColor ms_colorWithHexString:@"#224FA2"];
    self.selectedView = selected;
    [self addSubview:self.selectedView];
    
}

- (void)followTeam {
    NSLog(@"follow team");
    if (self.followBlock) {
        self.followBlock();
    }
}


- (void)headerButtonSelected:(UIButton *)sender {
    
    if (sender == self.selectedButton) {
        return;
    }
    self.selectedButton.selected = NO;
    sender.selected = !sender.selected;
    self.selectedButton = sender;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2f animations:^{
        CGFloat width = sender.bounds.size.width;
        CGPoint center = weakSelf.selectedView.center;
        center.x = sender.tag * width + width/2.0;
        weakSelf.selectedView.center = center;
    }];
    
    if ([self.delegate respondsToSelector:@selector(headerViewButtonSelectedAtIndex:)]) {
        [self.delegate headerViewButtonSelectedAtIndex:(int)sender.tag];
    }
    
}

- (void)setHeaderModel:(TeamHeaderModel *)headerModel {

    _headerModel = headerModel;
    [self.teamName setText:headerModel.name];
    [self.gameCount setText:headerModel.matchNum.description];//[NSString stringWithFormat:@"%@",headerModel.matchNum]
    [self.memberCount setText:[NSString stringWithFormat:@"%@",headerModel.memberNum]];
    [self.followCount setText:[NSString stringWithFormat:@"%@",headerModel.fansNum]];
    if (headerModel.focus) {
        [self.follow setEnabled:NO];
        [self.follow setTitle:@"取消关注" forState:UIControlStateDisabled];
    }
    [self.introduce setText:headerModel.introduction];
    
}


@end


























