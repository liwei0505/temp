//
//  FollowLeagueController.m
//  MyBasketBall
//
//  Created by lw on 16/12/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "FollowLeagueController.h"
#import "SearchLeagueCell.h"

@interface FollowLeagueController ()
@property (nonatomic, strong) NSMutableArray *leagueList;
@end

@implementation FollowLeagueController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    [self data];
}

- (void)prepareUI {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-SEGMENT_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 51;
    [self.view addSubview:self.tableView];
}

- (void)data {

    self.leagueList = [NSMutableArray arrayWithArray:@[@"touxiang",@"清华2016级研究生联赛",@"报名中",@"20球队 76比赛 800",@"关注"]];
}

#pragma mark - datasource and delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SearchLeagueCell *cell = [SearchLeagueCell cellWithTableView:tableView];
    cell.model = self.leagueList;
    return cell;
}

@end
