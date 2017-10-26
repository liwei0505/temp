//
//  FollowTeamController.m
//  MyBasketBall
//
//  Created by lw on 16/12/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "FollowTeamController.h"
#import "SearchMemberCell.h"

@interface FollowTeamController ()
@property (nonatomic, strong) NSMutableArray *teamList;
@end

@implementation FollowTeamController

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

    self.teamList = [NSMutableArray arrayWithArray:@[@"touxiang",@"勇士队",@"10球员   800关注"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    SearchMemberCell *cell = [SearchMemberCell cellWithTableView:tableView];
    cell.model = self.teamList;
    return cell;
}

@end
