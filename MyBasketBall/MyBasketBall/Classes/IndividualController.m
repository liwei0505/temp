//
//  IndividaulController.m
//  MyBasketBall
//
//  Created by lw on 16/12/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "IndividualController.h"
#import "SearchMemberCell.h"

@interface IndividualController ()
@property (nonatomic, strong) NSMutableArray *memberList;
@end

@implementation IndividualController

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
    self.memberList = [NSMutableArray arrayWithArray:@[@"touxiang",@"库里",@"后卫    800关注"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    SearchMemberCell *cell = [SearchMemberCell cellWithTableView:tableView];
    cell.model = self.memberList;
    return cell;

}


@end
