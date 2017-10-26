//
//  LeagueInSchoolViewController.m
//  basketBallTemplate
//
//  Created by lizhe on 16/10/22.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LeagueInSchoolViewController.h"
#import "MJRefresh.h"
#import "GetLeagueInSchoolThread.h"
#import "LeagueListTableViewCell.h"
#import "GetLeagueDetailsThread.h"
#import "LeagueDetailsViewController.h"

#define LeagueInSchoolRequestLimit 20

@interface LeagueInSchoolViewController ()

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray *arrayDatas;
@end

@implementation LeagueInSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"校内联赛";
    self.arrayDatas = [[NSMutableArray alloc] init];
    [self initTableView];
    [self initRefresh];
    [self.myTableView.mj_header beginRefreshing];

}

- (void)initTableView {
//    self.navigationController.navigationBar.backgroundColor = Color_Navigation_Background;
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H -NAVIGATION_HEIGHT)];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView setRowHeight:150];
    [self.myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.myTableView.backgroundColor = Color_TableView_Background;
    [self.view addSubview:self.myTableView];
    
}

- (void)initRefresh {
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestNewData];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松手刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    // 设置颜色
    header.stateLabel.textColor = [UIColor redColor];
    self.myTableView.mj_header = header;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self requestMoreData];
    }];
    [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"松手刷新" forState:MJRefreshStatePulling];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:15];
    // 设置颜色
    footer.stateLabel.textColor = [UIColor redColor];
    self.myTableView.mj_footer = footer;

}

#pragma mark -UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeagueListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leagueList"];
    
    if (nil == cell) {
        cell = [[LeagueListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leagueList" ];
    }
    LeagueListModel *model = [self.arrayDatas objectAtIndex:indexPath.row];
    [cell settingData:model];
    return cell;

   
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    LeagueListModel *model = [self.arrayDatas objectAtIndex:indexPath.row];
    
    if (![DataUtil isEmptyString:model.leagueId]) {
        [self requestDetailsData:model.leagueId];
    }
    
}

#pragma mark -HttpRequest Methods
- (void)requestNewData {
    GetLeagueInSchoolThread *thread = [[GetLeagueInSchoolThread alloc] initWithSchoolId:1 andLimit:LeagueInSchoolRequestLimit andTicket:0];
    [thread requireonPrev:^{
        ;
    } success:^(NSArray *dic) {
        
        [self.arrayDatas removeAllObjects];
        for (NSDictionary *myDic in dic) {
            LeagueListModel *model = [[LeagueListModel alloc] initWithDic:myDic];
            if (model != nil) {
                [self.arrayDatas addObject:model];
            }
        }
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView reloadData];
    } unavaliableNetwork:^{
        [self.myTableView.mj_header endRefreshing];
    } timeout:^{
        [self.myTableView.mj_header endRefreshing];
    } exception:^(NSString *message) {
        [self.myTableView.mj_header endRefreshing];
    }];
}

- (void)requestMoreData {
    GetLeagueInSchoolThread *thread = [[GetLeagueInSchoolThread alloc] initWithSchoolId:1 andLimit:LeagueInSchoolRequestLimit andTicket:0];
    [thread requireonPrev:^{
        ;
    } success:^(NSArray *dic) {
        for (NSDictionary *myDic in dic) {
            LeagueListModel *model = [[LeagueListModel alloc] initWithDic:myDic];
            if (model != nil) {
                [self.arrayDatas addObject:model];
            }
        }
        if ([dic count] < LeagueInSchoolRequestLimit) {
            [self.myTableView.mj_footer endRefreshingWithNoMoreData];
        } else {
           [self.myTableView.mj_footer endRefreshing];
        }
        
        [self.myTableView reloadData];
    } unavaliableNetwork:^{
        [self.myTableView.mj_footer endRefreshing];
    } timeout:^{
        [self.myTableView.mj_footer endRefreshing];
    } exception:^(NSString *message) {
        [self.myTableView.mj_footer endRefreshing];
    }];
}

- (void)requestDetailsData:(NSString *)leagueId {
    GetLeagueDetailsThread *thread = [[GetLeagueDetailsThread alloc] initWithLeagueId:leagueId];
    [thread requireonPrev:^{
        ;
    } success:^(NSDictionary *dic) {
        NSLog(@"联赛详细信息");
        LeagueDetailsViewController *VC = [[LeagueDetailsViewController alloc] init];
        [VC settingData];
        [self.navigationController pushViewController:VC animated:YES];
    } unavaliableNetwork:^{
        ;
    } timeout:^{
        ;
    } exception:^(NSString *message) {
        ;
    }];
}


@end
