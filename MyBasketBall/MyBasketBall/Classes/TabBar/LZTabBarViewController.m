//
//  LZTabBarViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/11.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LZTabBarViewController.h"
#import "TabLeagueViewController.h"
#import "MoreViewController.h"
#import "HotViewController.h"
#import "BaseNaviController.h"
#import "FollowViewController.h"

@interface LZTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation LZTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.delegate = self;
    [self setTabViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)setTabViewController {
    
    HotViewController *hot = [[HotViewController alloc] init];
    BaseNaviController *hotNav = [[BaseNaviController alloc] initWithRootViewController:hot];
//    hotNav.tabBarItem.image = [UIImage imageNamed:@""];
    hotNav.tabBarItem.title = @"热门";
    
    TabLeagueViewController *leagueViewController = [[TabLeagueViewController alloc] init];
    BaseNaviController *nav_league = [[BaseNaviController alloc] initWithRootViewController:leagueViewController];
//    nav_league.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"比赛" image:[UIImage imageNamed:@"invest"] tag:1];
    nav_league.tabBarItem.title = @"比赛";
//    nav_league.tabBarItem.badgeValue = @"2";
    
    FollowViewController *dynamicViewController = [[FollowViewController alloc] init];
    BaseNaviController *nav_dynamic = [[BaseNaviController alloc] initWithRootViewController:dynamicViewController];
//    nav_dynamic.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[UIImage imageNamed:@"home"] tag:0];
    nav_dynamic.tabBarItem.title = @"关注";
//    nav_dynamic.tabBarItem.badgeValue = @"1";
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    BaseNaviController *nav_personInfo = [[BaseNaviController alloc] initWithRootViewController:moreViewController];
//    nav_personInfo.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"更多" image:[UIImage imageNamed:@"account"] tag:2];
    nav_personInfo.tabBarItem.title = @"更多";
//    nav_personInfo.tabBarItem.badgeValue = @"3";
    
    self.viewControllers = @[hotNav, nav_league, nav_dynamic, nav_personInfo];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {

    NSLog(@"%lu--%@",(unsigned long)self.selectedIndex,viewController);

    
}



@end
