//
//  LeagueDetailsViewController.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LeagueDetailsViewController.h"
#import "YYText.h"
#import "LZProgressView.h"
#import "SDAutoLayout.h"
#import "LZSimpleTextView.h"
#import "LeagueMatchTableViewCell.h"
@interface LeagueDetailsViewController ()

@property (nonatomic, strong)UIImageView *imageViewLogo;
@property (nonatomic, strong)UILabel *labelLeagueTitle;
@property (nonatomic, strong)UIView  *viewSeperateOne;
@property (nonatomic, strong)YYLabel *labelTeam;
@property (nonatomic, strong)YYLabel *labelMatch;
@property (nonatomic, strong)YYLabel *labelFan;
@property (nonatomic, strong)LZProgressView *viewProgress;
@property (nonatomic, strong)UIView  *viewSeperateTwo;
@property (nonatomic, strong)LZSimpleTextView *textViewIntro;
@property (nonatomic, strong)UIButton *btnFan;
@property (nonatomic, strong)UIView  *viewSeperateThree;

@property (nonatomic, strong)UITableView *myTableView;
@property (nonatomic, strong)NSMutableArray *arrayDataSource;
@end

@implementation LeagueDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomLeftBarButtonItem];
    self.title = @"联赛信息";

}

- (void)initUI {
    self.imageViewLogo = [[UIImageView alloc] init];
    self.labelLeagueTitle = [[UILabel alloc] init];
    self.viewSeperateOne = [[UIView alloc] init];
    self.labelTeam = [[YYLabel alloc] init];
    self.labelMatch = [[YYLabel alloc] init];
    self.labelFan = [[YYLabel alloc] init];
    self.viewProgress = [[LZProgressView alloc] init];
    self.viewSeperateTwo = [[UIView alloc] init];
    self.textViewIntro = [[LZSimpleTextView alloc] initWithTitle:@"简介" andEditAble:NO andMaxLength:0 andPlaceHolder:nil];
    self.btnFan = [UIButton buttonWithType:UIButtonTypeSystem];
    self.viewSeperateThree = [[UIView alloc] init];
    [self.view addSubview:self.imageViewLogo];
    [self.view addSubview:self.labelLeagueTitle];
    [self.view addSubview:self.viewSeperateOne];
    [self.view addSubview:self.labelTeam];
    [self.view addSubview:self.labelMatch];
    [self.view addSubview:self.labelFan];
    [self.view addSubview:self.viewProgress];
    [self.view addSubview:self.viewSeperateTwo];
    [self.view addSubview:self.textViewIntro];
    [self.view addSubview:self.btnFan];
    [self.view addSubview:self.viewSeperateThree];
}

- (void)settingFrame {
    {
        self.imageViewLogo.frame = CGRectMake(LEFT_TO_SCREEN, 10, 60, 60);
        self.imageViewLogo.layer.cornerRadius = self.imageViewLogo.frame.size.width / 2;
        self.imageViewLogo.backgroundColor = [UIColor redColor];
    }
    {
        self.labelLeagueTitle.sd_layout
        .leftSpaceToView(self.imageViewLogo, 10)
        .topEqualToView(self.imageViewLogo)
        .rightSpaceToView(self.view, LEFT_TO_SCREEN)
        .heightIs(20);
    }
    {
        self.viewSeperateOne.sd_layout
        .leftEqualToView(self.labelLeagueTitle)
        .rightEqualToView(self.labelLeagueTitle)
        .topSpaceToView(self.labelLeagueTitle, 2)
        .heightIs(1);
    }
    {
        self.labelTeam.numberOfLines = 0;
        self.labelTeam.sd_layout
        .topSpaceToView(self.viewSeperateOne, 5)
        .leftEqualToView(self.labelLeagueTitle)
        .widthIs(50)
        .maxHeightIs(40);
    }
    {
        self.labelMatch.numberOfLines = 0;
        self.labelMatch.sd_layout
        .topEqualToView(self.labelTeam)
        .centerXEqualToView(self.labelLeagueTitle)
        .widthIs(50)
        .heightRatioToView(self.labelTeam, 1);
    }
    {
        self.labelFan.numberOfLines = 0;
        self.labelFan.sd_layout
        .topEqualToView(self.labelTeam)
        .rightEqualToView(self.labelLeagueTitle)
        .widthIs(80)
        .heightRatioToView(self.labelTeam, 1);
    }
    {
        self.viewProgress.sd_layout
        .leftSpaceToView(self.view, LEFT_TO_SCREEN)
        .rightSpaceToView(self.view, LEFT_TO_SCREEN)
        .topSpaceToView(self.imageViewLogo, 5)
        .maxHeightIs(30);
    }
    {
        self.viewSeperateTwo.sd_layout
        .leftSpaceToView(self.view, LEFT_TO_SCREEN)
        .rightSpaceToView(self.view, LEFT_TO_SCREEN)
        .topSpaceToView(self.viewProgress, 2)
        .heightIs(1);
    }
    {
        self.textViewIntro.sd_layout
        .leftSpaceToView(self.view, LEFT_TO_SCREEN)
        .rightSpaceToView(self.view, LEFT_TO_SCREEN)
        .topSpaceToView(self.viewSeperateTwo, 3)
        .heightIs(100);
    }
    {
        self.btnFan.sd_layout
        .topSpaceToView(self.textViewIntro, 5)
        .rightSpaceToView(self.view, LEFT_TO_SCREEN + 10)
        .widthIs(60)
        .heightIs(25);
    }
    {
        self.viewSeperateThree.sd_layout
        .leftSpaceToView(self.view, -0.5)
        .widthIs(SCR_W + 1)
        .topSpaceToView(self.btnFan, 5)
        .heightIs(10);
    }
}

- (void)settingData {
    [self initUI];
    [self settingFrame];
    
    self.labelLeagueTitle.text = @"北工大计算机联赛";
    self.labelLeagueTitle.font = [UIFont systemFontOfSize:text_size_normal];
    self.labelLeagueTitle.textColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
    
    self.viewSeperateOne.backgroundColor = UIColorFromRGB(LZCOLOR_BACKGROUND_GRAY);
    
    {
        NSMutableAttributedString *teamNum = [[NSMutableAttributedString alloc] initWithString:@"8\n"];
        teamNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        teamNum.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        teamNum.yy_alignment = NSTextAlignmentCenter;
        NSMutableAttributedString *teamStr = [[NSMutableAttributedString alloc] initWithString:@"参赛球队"];
        teamStr.yy_color = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
        teamStr.yy_font = [UIFont systemFontOfSize:text_size_smaller];
        teamStr.yy_alignment = NSTextAlignmentCenter;
        [teamNum appendAttributedString:teamStr];
        self.labelTeam.attributedText = teamNum;
    }
    {
        NSMutableAttributedString *matchNum = [[NSMutableAttributedString alloc] initWithString:@"22\n"];
        matchNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        matchNum.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        matchNum.yy_alignment = NSTextAlignmentCenter;
        NSMutableAttributedString *matchStr = [[NSMutableAttributedString alloc] initWithString:@"比赛"];
        matchStr.yy_color = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
        matchStr.yy_font = [UIFont systemFontOfSize:text_size_smaller];
        matchStr.yy_alignment = NSTextAlignmentCenter;
        [matchNum appendAttributedString:matchStr];
        self.labelMatch.attributedText = matchNum;
    }
    {
        NSMutableAttributedString *FanNum = [[NSMutableAttributedString alloc] initWithString:@"100000\n"];
        FanNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        FanNum.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        FanNum.yy_alignment = NSTextAlignmentCenter;
        NSMutableAttributedString *FanStr = [[NSMutableAttributedString alloc] initWithString:@"关注的人"];
        FanStr.yy_color = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
        FanStr.yy_font = [UIFont systemFontOfSize:text_size_smaller];
        FanStr.yy_alignment = NSTextAlignmentCenter;
        [FanNum appendAttributedString:FanStr];
        self.labelFan.attributedText = FanNum;
    }
    {
        [self.viewProgress setLeftLable:@"正在进行中 " andFont:[UIFont systemFontOfSize:text_size_normal] andColor:UIColorFromRGB(LZCOLOR_GREEN)];
        
        NSMutableAttributedString *progressNow = [[NSMutableAttributedString alloc] initWithString:@"50"];
        progressNow.yy_font = [UIFont systemFontOfSize:text_size_small];
        progressNow.yy_color = UIColorFromRGB(LZCOLOR_RED);
        NSMutableAttributedString *progressTotal = [[NSMutableAttributedString alloc] initWithString:@"/100"];
        progressTotal.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        progressTotal.yy_font = [UIFont systemFontOfSize:text_size_small];
        [progressNow appendAttributedString:progressTotal];
        [self.viewProgress setRightLable:progressNow];
        
        [self.viewProgress setDataWithProgress:50 andTotal:100];
    }
    
    self.viewSeperateTwo.backgroundColor = UIColorFromRGB(LZCOLOR_BACKGROUND_GRAY);
    
    {
        self.textViewIntro.labelTitle.textColor = UIColorFromRGB(LZCOLOR_MAIN);
        NSString *str = @"发掘的沙拉福建省；奥拉夫就撒了；附件萨拉飞机撒旦了看法加深了；大姐夫；爱睡懒觉发生了；看附件是拉开积分萨拉；发送到了；附件是咖啡就睡啦；飞机上课了附近的萨洛克；附件撒开飞机萨拉丁；富家大室立刻就浪费李建安费卢卡斯解放了；就加；上了积分；撒娇；发";
        [self.textViewIntro setTextViewContent:str];
    }
    {
        self.btnFan.layer.cornerRadius = 8;
        self.btnFan.layer.borderColor = UIColorFromRGB(LZCOLOR_MAIN).CGColor;
        self.btnFan.layer.borderWidth = 2;
        [self.btnFan setTitle:@"关注" forState:UIControlStateNormal];
        [self.btnFan setTitleColor:UIColorFromRGB(LZCOLOR_MAIN) forState:(UIControlStateNormal)];
    }
    {
        self.viewSeperateThree.backgroundColor = UIColorFromRGB(LZCOLOR_BACKGROUND_GRAY);
        self.viewSeperateThree.layer.borderColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY).CGColor;
        self.viewSeperateThree.layer.borderWidth = 1;
    }
//    [self.view updateLayout];
    [self initTableView];
}

- (void)initTableView {
    self.myTableView = [[UITableView alloc] init];
    [self.view addSubview:self.myTableView];
    self.myTableView.sd_layout
        .topEqualToView(self.viewSeperateThree)
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .bottomEqualToView(self.view);
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView setRowHeight:90];
    [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    self.myTableView.backgroundColor = [UIColor redColor];  //Color_TableView_Background;
    [self.view addSubview:self.myTableView];
    
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
    return self.arrayDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeagueMatchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leagueMatchList"];
    
    if (nil == cell) {
        cell = [[LeagueMatchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leagueMatchList" ];
    }
    [cell settingData];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    LeagueListModel *model = [self.arrayDatas objectAtIndex:indexPath.row];
//    [cell settingData:model];
    return cell;

}

#pragma mark - uitableviewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
