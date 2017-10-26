//
//  FollowViewController.h
//  MyBasketBall
//
//  Created by lw on 16/12/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "BaseViewController.h"
#import "HMSegmentedControl.h"
#import "IndividualController.h"
#import "FollowTeamController.h"
#import "FollowLeagueController.h"

@interface FollowViewController : BaseViewController

@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) IndividualController *individual;
@property (nonatomic, strong) FollowTeamController *followTeam;
@property (nonatomic, strong) FollowLeagueController *followLeague;
@property (nonatomic, strong) UIViewController *currentController;
@property (nonatomic, strong) UIView *containView;

@end
