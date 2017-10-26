//
//  LeagueBetweenSchoolViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/23.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LeagueBetweenSchoolViewController.h"
#import "MJRefresh.h"
#import "LeagueListTableViewCell.h"
@interface LeagueBetweenSchoolViewController ()

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *arrayDatas;
@end

@implementation LeagueBetweenSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"校际联赛";
    self.arrayDatas = [[NSMutableArray alloc] init];
    
    [self initTableView];
    [self initRefresh];
    [self requestNewData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTableView {
    self.navigationController.navigationBar.backgroundColor = Color_Navigation_Background;
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H- SEGMENT_HEIGHT -NAVIGATION_HEIGHT)];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView setRowHeight:60];
    [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.myTableView.backgroundColor = Color_TableView_Background;
    //    [self.view setBackgroundColor:[UIColor redColor]];

    [self.view addSubview:self.myTableView];

}

- (void)initRefresh {
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestNewData];
    }];
    
    self.myTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestMoreData];
    }];
}

#pragma mark -HttpRequest Methods
- (void)requestNewData {
    
}

- (void)requestMoreData {
    
}

#pragma mark -UITableView Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeagueListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leagueListCell"];
    LeagueListModel *model = [self.arrayDatas objectAtIndex:indexPath.row];
    if (nil == cell) {
        cell = [[LeagueListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leagueListCell" ];
    }

    [cell settingData:model];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDatas.count;
}

#pragma mark -
#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    //获取单个cell的具体信息, 网络请求
//    MyTaskOverview *myTaskOverview = [_myTaskOverviewArray objectAtIndex:indexPath.row];
//    if (NO ==  myTaskOverview.hasRead) {
//        myTaskOverview.hasRead = YES;
//        [self saveMyTaskResultHasRead:myTaskOverview];
//    }
//    self.detailsViewCtrl = [[MyTaskDetailsViewController alloc] initWithMyTaskOverview:myTaskOverview];
//    [self.navigationController pushViewController:self.detailsViewCtrl animated:YES];
    
}


@end
