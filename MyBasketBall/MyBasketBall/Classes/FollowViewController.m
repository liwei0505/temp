//
//  FollowViewController.m
//  MyBasketBall
//
//  Created by lw on 16/12/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "FollowViewController.h"

@interface FollowViewController ()

{
    IndexChangeBlock indexBlock;
}

//@property (nonatomic, copy) IndexChangeBlock indexBlock;


@end

@implementation FollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareUI {

    self.title = @"关注";
    [self setCustomLeftBarButtonItem];
    [self setCustomRightBarButtonItem];
    self.view.backgroundColor = [UIColor whiteColor];
    //先set block 再将block set给segmentcontrol
    [self initIndexBlock];
    [self initSegmentedControl];
    
}

- (void)initSegmentedControl {

    NSArray *items = [NSArray arrayWithObjects:@"个人",@"球队",@"联赛", nil];
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:items];
    self.segmentedControl.frame = CGRectMake(0, 0, SCR_W, SEGMENT_HEIGHT);
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGB(LZCOLOR_MAIN),NSFontAttributeName:[UIFont systemFontOfSize:text_size_small]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName:UIColorFromRGB(LZCOLOR_MAIN)};  //BLUECOLOR
    self.segmentedControl.selectionIndicatorColor = UIColorFromRGB(LZCOLOR_MAIN);
    self.segmentedControl.selectionIndicatorHeight = 3;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;

    self.containView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, SCR_W, SCR_H-94-49)];
    [self.view addSubview:self.containView];
    [self.view addSubview:self.segmentedControl];
    
    self.individual = [[IndividualController alloc] init];
    self.followTeam = [[FollowTeamController alloc] init];
    self.followLeague = [[FollowLeagueController alloc] init];
    [self addChildViewController:self.individual];
    [self addChildViewController:self.followTeam];
    [self addChildViewController:self.followLeague];
    
    [self.containView addSubview:self.individual.view];
    self.currentController = self.individual;
    [self.segmentedControl setIndexChangeBlock:indexBlock];
    
}

- (void)initIndexBlock {
    
    __weak FollowViewController *controller = self;
    indexBlock = ^(NSInteger index) {
        UIViewController *to;
        if (0 == index) {
            to = controller.individual;
        }else if (1 == index){
            to = controller.followTeam;
        }else if (2 == index) {
            to = controller.followLeague;
        }
        [controller transitionFromViewController:controller.currentController
                                toViewController:to
                                        duration:0
                                         options:(UIViewAnimationOptionTransitionNone)
                                      animations:^{
                                      }
                                      completion:^(BOOL finished) {
                                          if (finished) {
                                              controller.currentController = to;
                                          }
                                          
                                      }];
    };
}

@end
