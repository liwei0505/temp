//
//  BattleDetailController.m
//  MyBasketBall
//
//  Created by lw on 17/1/10.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "BattleDetailController.h"
#import "BattleDetailHeaderView.h"

typedef NS_ENUM(NSInteger, SelectedType) {
    TYPE_LIVE = 0,
    TYPE_STATIC = 1,
    TYPE_AUTO = 2,
};

@interface BattleDetailController ()

@property (nonatomic, assign) int selectedType;

@end

@implementation BattleDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
}

- (void)prepareUI {

    CGFloat height = self.view.bounds.size.height;
    BattleDetailHeaderView *headerView = [[BattleDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, 170)];
    __weak typeof(self)weakSelf = self;
    headerView.titleButtonBlock = ^(int index){
    
        if (weakSelf.selectedType == index) {
            return;
        }
        BOOL reload = false;
        switch (index) {
            case 0:
                weakSelf.selectedType = TYPE_LIVE;
                reload = true;
                break;
            case 1:
                weakSelf.selectedType = TYPE_STATIC;
                reload = true;
                break;
            case 2:
                weakSelf.selectedType = TYPE_AUTO;
                reload = true;
                break;
            default:
                break;
        }
        if (reload) {
            [weakSelf.tableView reloadData];
        }
    };
    [self.view addSubview:headerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), SCR_W, height-168 ) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.selectedType = TYPE_LIVE;
    
}

#pragma mark - tableview datasource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.selectedType) {
        case TYPE_LIVE: {
            return 3;
        }
            break;
        case TYPE_STATIC: {
            return 2;
        }
            break;
        case TYPE_AUTO: {
            return 2;
        }
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    switch (self.selectedType) {
        case TYPE_LIVE:
            return 30;
            break;
        case TYPE_STATIC:
            return 40;
            break;
        case TYPE_AUTO:
            return 40;
            break;
        default:
            return 0;
            break;
    }
}

@end
