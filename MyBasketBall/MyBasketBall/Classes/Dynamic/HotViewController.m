//
//  HotViewController.m
//  MyBasketBall
//
//  Created by lw on 16/12/10.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "HotViewController.h"
#import "TeamStatusCell.h"

@interface HotViewController ()

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomRightBarButtonItem];
    [self setCustomLeftBarButtonItem];
    [self prepareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)prepareUI {

    self.title = @"热门";
    self.view.backgroundColor = [UIColor ms_colorWithHexString:@"#224FA2"];
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height-49) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 90;
    self.tableView.sectionHeaderHeight = 22;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view insertSubview:self.tableView belowSubview:self.navigationController.navigationBar];
//    [self.view addSubview:self.tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TeamStatusCell *cell = [TeamStatusCell cellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"对战界面");

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    float width = self.view.bounds.size.width;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 22)];
    view.backgroundColor = [UIColor ms_colorWithHexString:@"#EFEFEF"];
    UILabel *title = [UILabel labelWithTitle:@"昨天 11月 5日 周三" size:15.0 colorString:@"#000000"];
    title.center = view.center;
    [view addSubview:title];
    return view;
}

@end
