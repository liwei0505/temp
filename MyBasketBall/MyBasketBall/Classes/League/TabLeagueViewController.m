//
//  TabLeagueViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/12.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "TabLeagueViewController.h"
#import "UIButton+Custom.h"
#import "CreateTeamController.h"
//#import "BattleDetailController.h"
#import "CreateLeagueController.h"

@interface TabLeagueViewController ()
{
    IndexChangeBlock myIndexBlock;
}
//@property (nonatomic, strong) UIView *navSuperView;
@property (nonatomic, strong) UIButton *create;
@property (nonatomic, strong) UIButton *createLeague;
@property (nonatomic, strong) UIButton *createTeam;
@property (nonatomic, strong) UIButton *date;

@end

@implementation TabLeagueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:text_size_normal]};
//    self.navSuperView = [[UIView alloc] init];
//    self.navSuperView.backgroundColor = UIColorFromRGB(LZCOLOR_MAIN);
//    self.navSuperView.frame = CGRectMake(0, 64, SCR_W, 44);
//    [self.navSuperView addSubview:_HMSegmentedCtrl];
//    self.navigationItem.titleView = self.navSuperView;
/*
//    [self.navigationController.navigationBar addSubview: _HMSegmentedCtrl];
    //    [self setCustomNavigationLeftBar];
*/
}

- (void)prepareUI {

    self.title = @"比赛";
    self.view.frame = CGRectMake(0, 64, SCR_W, SCR_H-TABBAR_HEIGHT-NAVIGATION_HEIGHT);
    [self.view setBackgroundColor:[UIColor redColor]];
    [self setCustomLeftBarButtonItem];
    [self setCustomRightBarButtonItem];
    [self setMyBlock];
    [self initHMSegmentedCtrl];
    [self setCreateButtons];
    
}

- (void)setMyBlock {
    __weak TabLeagueViewController *controller = self;
    myIndexBlock = ^(NSInteger index) {
        UIViewController *to;
        if (0 == index) {
            to = controller.viewCtrlInSchool;
        }else if (1 == index){
            to = controller.viewCtrlBetSchool;
        }else if (2 == index) {
            to = controller.viewCtrlMine;
        }
        
        [controller transitionFromViewController:controller.currentViewController
                                toViewController:to
                                        duration:0
                                         options:(UIViewAnimationOptionTransitionNone)
                                      animations:^{
                                      }
                                      completion:^(BOOL finished) {
                                          if (finished) {
                                              controller.currentViewController = to;
                                          }
                                      }];
    };
}

- (void)initHMSegmentedCtrl
{
    NSArray* items=[NSArray arrayWithObjects:@"校内联赛", @"校际联赛", @"约战", nil];
    _HMSegmentedCtrl = [[HMSegmentedControl alloc]initWithSectionTitles:items];
    _HMSegmentedCtrl.frame = CGRectMake(0, 0, SCR_W, SEGMENT_HEIGHT);
    //    [_HMSegmentedCtrl addBottomLine];
    //    _HMSegmentedCtrl.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    _HMSegmentedCtrl.backgroundColor = [UIColor whiteColor];
    //设置导航标题的颜色及字体大小
    _HMSegmentedCtrl.titleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGB(LZCOLOR_MAIN),NSFontAttributeName:[UIFont systemFontOfSize:text_size_small]};
    _HMSegmentedCtrl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGB(LZCOLOR_MAIN)};  //BLUECOLOR
    _HMSegmentedCtrl.selectionIndicatorColor = UIColorFromRGB(LZCOLOR_MAIN);
    _HMSegmentedCtrl.selectionIndicatorHeight = 3;
    _HMSegmentedCtrl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _HMSegmentedCtrl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
//    _HMSegmentedCtrl.verticalDividerEnabled = NO;
//    _HMSegmentedCtrl.verticalDividerColor = UIColorFromRGB(LZCOLOR_MAIN);
    
    _containView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, SCR_W, SCR_H-94-49)];
    [self.view addSubview:_containView];
    [self.view addSubview:_HMSegmentedCtrl];
    
    self.viewCtrlInSchool = [[LeagueInSchoolViewController alloc]init];
    self.viewCtrlBetSchool = [[LeagueBetweenSchoolViewController alloc] init];
    //    self.viewCtrlOutSchool = [[LeagueOutSchoolViewController alloc]init];
    self.viewCtrlMine = [[LeagueMineViewController alloc]init];
    [self addChildViewController:self.viewCtrlInSchool];
    [self addChildViewController:self.viewCtrlBetSchool];
    [self addChildViewController:self.viewCtrlMine];
    [self.containView addSubview:self.viewCtrlInSchool.view];
    _currentViewController = self.viewCtrlInSchool;
    [_HMSegmentedCtrl setIndexChangeBlock:myIndexBlock];
    
}

- (void)setCreateButtons {

    float height = self.view.bounds.size.height;
    self.create = [UIButton buttonWithType:UIButtonTypeCustom];
    self.create.layer.cornerRadius = 17.5;
    self.create.layer.masksToBounds = YES;
    [self.create setImage:[UIImage imageNamed:@"touxiang"] forState:UIControlStateNormal];
    [self.create setImage:[UIImage imageNamed:@"icon6"] forState:UIControlStateSelected];
    self.create.frame = CGRectMake(15, height-55, 35, 35);
    [self.create addTarget:self action:@selector(createButtonClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.create];
    [self.view bringSubviewToFront:self.create];
    
    self.createLeague = [UIButton colorButtonWithTitle:@"创建联赛" fontSize:12.0 titleColor:@"#FFFFFF" backgroundColor:@"#4A90E2"];
    self.createLeague.tag = 0;
    self.createLeague.layer.cornerRadius = 21.5;
    self.createLeague.layer.masksToBounds = YES;
    self.createLeague.frame = CGRectMake(20, height-118, 43, 43);
    [self.view addSubview:self.createLeague];
    [self.view bringSubviewToFront:self.createLeague];
    self.createLeague.hidden = YES;
    [self.createLeague addTarget:self action:@selector(createItemsClick:) forControlEvents:UIControlEventTouchUpInside];

    self.createTeam = [UIButton colorButtonWithTitle:@"创建球队" fontSize:12.0 titleColor:@"#FFFFFF" backgroundColor:@"#F76672"];
    self.createTeam.tag = 1;
    self.createTeam.layer.cornerRadius = 21.5;
    self.createTeam.layer.masksToBounds = YES;
    [self.createTeam.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.createTeam.frame = CGRectMake(73, height-100, 43, 43);
    [self.view addSubview:self.createTeam];
    [self.view bringSubviewToFront:self.createTeam];
    self.createTeam.hidden = YES;
    [self.createTeam addTarget:self action:@selector(createItemsClick:) forControlEvents:UIControlEventTouchUpInside];

    self.date = [UIButton colorButtonWithTitle:@"约战" fontSize:12.0 titleColor:@"#FFFFFF" backgroundColor:@"#3AB89C"];
    self.date.tag = 2;
    self.date.layer.cornerRadius = 21.5;
    self.date.layer.masksToBounds = YES;
    self.date.frame = CGRectMake(63, height-48, 43, 43);
    [self.view addSubview:self.date];
    [self.view bringSubviewToFront:self.date];
    self.date.hidden = YES;
    [self.date addTarget:self action:@selector(createItemsClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)createButtonClick:(UIButton *)sender {

    self.createLeague.hidden = !self.createLeague.hidden;
    self.createTeam.hidden = !self.createTeam.hidden;
    self.date.hidden = !self.date.hidden;
    
}

- (void)createItemsClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0: {
            NSLog(@"创建联赛");
//            BattleDetailController *battle = [[BattleDetailController alloc] init];
//            battle.title = @"一队 VS 二队";
            CreateLeagueController *create = [[CreateLeagueController alloc] init];
            [self.navigationController pushViewController:create animated:YES];
        }
            break;
        case 1: {
            CreateTeamController *createTeam = [[CreateTeamController alloc] init];
            [self.navigationController pushViewController:createTeam animated:YES];
        }
            break;
        case 2: {
            NSLog(@"约战");
        }
            break;
        default:
            break;
    }

}

@end
