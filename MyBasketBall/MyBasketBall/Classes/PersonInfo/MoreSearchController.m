//
//  MoreSubController.m
//  MyBasketBall
//
//  Created by lw on 16/12/26.
//  Copyright © 2016年 lizhe. All rights reserved.
//
#import "MoreSearchController.h"
#import "SearchLeagueCell.h"
#import "SearchMemberCell.h"

@interface MoreSearchController ()<UISearchBarDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) NSMutableArray *searchList;

@property (nonatomic, strong) NSMutableArray *teamList;
@property (nonatomic, strong) NSMutableArray *memberList;
@property (nonatomic, strong) NSMutableArray *leagueList;

@end

@implementation MoreSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareData];
    [self prepareUI];
    
}

- (void)prepareUI {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 51;
    [self.view addSubview:self.tableView];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
//    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (self.type) {
        case MORE_TEAM: {
            if (self.searchController.active) {
                return self.searchList.count;
            } else {
                return self.teamList.count;
            }
        }
            break;
        case MORE_MEMBER: {
            if (self.searchController.active) {
                return self.searchList.count;
            } else {
                return self.memberList.count;
            }
        }
            break;
        case MORE_LEAGUE: {
            if (self.searchController.active) {
                return self.searchList.count;
            } else {
                return self.leagueList.count;
            }
        }
            break;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (self.type) {
        case MORE_TEAM: {
            SearchMemberCell *cell = [SearchMemberCell cellWithTableView:tableView];
            cell.model = self.teamList;
            return cell;
        }
            break;
        case MORE_MEMBER: {
            SearchMemberCell *cell = [SearchMemberCell cellWithTableView:tableView];
            cell.model = self.memberList;
            return cell;
        }
            break;
        case MORE_LEAGUE: {
            SearchLeagueCell *cell = [SearchLeagueCell cellWithTableView:tableView];
            cell.followBlock = ^{
                NSLog(@"follow button!");
            };
            cell.model = self.leagueList;
            return cell;
        }
            break;
    }
    
//    if (self.searchController.active) {
//        return [[UITableViewCell alloc] init];
//    } else {
//        return [[UITableViewCell alloc] init];
//    }
}

#pragma mark - delegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {

    NSString *searchStr = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchStr];
    if (self.searchList != nil) {
        [self.searchList removeAllObjects];
    }
    
    //过滤数据
    self.searchList = [NSMutableArray arrayWithArray:[self.dataList filteredArrayUsingPredicate:preicate]];
    [self.tableView reloadData];
    
}

#pragma mark - private

- (void)prepareData {

    switch (self.type) {
        case MORE_TEAM: {
            self.teamList = [NSMutableArray arrayWithArray:@[@"touxiang",@"勇士队",@"10球员   800关注"]];
        }
            break;
        case MORE_MEMBER: {
            self.memberList = [NSMutableArray arrayWithArray:@[@"touxiang",@"库里",@"后卫    800关注"]];
        }
            break;
        case MORE_LEAGUE: {
            self.leagueList = [NSMutableArray arrayWithArray:@[@"touxiang",@"清华2016级研究生联赛",@"报名中",@"20球队 76比赛 800",@"关注"]];
        }
            break;
        default:
            break;
    }
    
}

@end
