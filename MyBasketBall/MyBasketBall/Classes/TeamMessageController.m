//
//  TeamMessageController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamMessageController.h"
#import "UILabel+Custom.h"
#import "TeamHeaderView.h"
#import "MemberBattleCell.h"
#import "TeamMemberCell.h"
#import "TeamGloryCell.h"
#import "MemberDataCell.h"
//#import "TableData.h"
#import "TeamMessageViewModel.h"
#import "UserInfoStatisticModel.h"
#import "ManageTeamController.h"
#import "JoinTeamController.h"

typedef NS_ENUM(NSInteger, SelectedType) {
    TYPE_STATUS = 0,
    TYPE_DATA = 1,
    TYPE_MEMBER = 2,
    TYPE_GLORY = 3,
};

@interface TeamMessageController ()<TeamHeaderViewButtonSelectedDelegate>

@property (nonatomic, strong) TeamHeaderView *headerView;
@property (nonatomic, assign) int selectedType;
@property (nonatomic, assign) int testHeight;

@property (nonatomic, strong) TeamMessageViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *dynamicArray;
@property (nonatomic, strong) NSDictionary *statisticDict;
@property (nonatomic, strong) NSArray *keys;
@property (nonatomic, strong) NSArray *memberArray;
@property (nonatomic, strong) NSArray *gloryArray;

@end

@implementation TeamMessageController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[TeamMessageViewModel alloc] init];
    [self prepareUI];
    [self prepareRightItems];
    [self requestHeaderData];
    [self requestDynamicData];
}

#pragma mark - UI

- (void)prepareUI {
    
    self.title = @"球队信息";
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    self.headerView = [[TeamHeaderView alloc] initWithFrame:CGRectMake(0, 0, width, 200)];
    self.headerView.delegate = self;
    __weak typeof(self)weakSelf = self;
    self.headerView.followBlock = ^{
        [weakSelf.viewModel queryTeamFollowWithUserId:[AppDelegate instance].userModel.userId teamId:[AppDelegate instance].userModel.teamId complete:^(UIState state, id result) {
            if (state == 1) {
                weakSelf.headerView.follow.enabled = weakSelf.headerView.follow.enabled;
            }
        }];
    };
    [self.view addSubview:self.headerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), width, height - 200 - 64)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.selectedType = TYPE_STATUS;
    self.testHeight = 300;
}

//- (void)prepareLeftItem {
//
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(leftClick)];
//    self.navigationItem.leftBarButtonItem = left;
//}
//
//- (void)leftClick {
//    if (self.leftItemBlock) {
//        self.leftItemBlock();
//    } else {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}

- (void)prepareRightItems {

    UIBarButtonItem *manage = [[UIBarButtonItem alloc] initWithTitle:@"管理" style:UIBarButtonItemStylePlain target:self action:@selector(manage)];
    UIBarButtonItem *join = [[UIBarButtonItem alloc] initWithTitle:@"加入" style:UIBarButtonItemStylePlain target:self action:@selector(join)];
    self.navigationItem.rightBarButtonItems = @[manage, join];
}

- (void)manage {
    NSLog(@"管理");
    ManageTeamController *manage = [[ManageTeamController alloc] init];
    [self.navigationController pushViewController:manage animated:YES];
    
}

- (void)join {
    NSLog(@"加入");
    JoinTeamController *join = [[JoinTeamController alloc] init];
    [self.navigationController pushViewController:join animated:YES];
}

- (void)headerViewButtonSelectedAtIndex:(int)index {

    self.selectedType = index;
    switch (self.selectedType) {
        case TYPE_STATUS:
            [self requestDynamicData];
            break;
        case TYPE_DATA: {
            __weak typeof(self)weakSelf = self;
            [self.viewModel queryTeamStatisticWithTeamId:[AppDelegate instance].userModel.teamId complete:^(UIState state, id result) {
                if (state == 1) {
                    weakSelf.keys = [result allKeys];
                    weakSelf.statisticDict = result;
                }
            }];
        }
            break;
        case TYPE_MEMBER: {
            __weak typeof(self)weakSelf = self;
            [self.viewModel queryTeamMemberWithTeamId:[AppDelegate instance].userModel.teamId complete:^(UIState state, id result) {
                if (state == 1) {
                    weakSelf.memberArray = result;
                }
            }];
        }
            break;
        case TYPE_GLORY: {
            __weak typeof(self)weakSelf = self;
            [self.viewModel queryTeamGloryWithTeamId:[AppDelegate instance].userModel.teamId complete:^(UIState state, id result) {
                if (state == 1) {
                    weakSelf.gloryArray = result;
                }
            }];
        }
            break;
        default:
            break;
    }
    [self.tableView reloadData];
    
}

#pragma mark - request data 

- (void)requestHeaderData {

    __weak typeof(self)weakSelf = self;
    [self.viewModel queryTeamHeaderWithUserId:[AppDelegate instance].userModel.userId teamId:[AppDelegate instance].userModel.teamId complete:^(UIState state, id result) {
        if (state == 1) {
            weakSelf.headerView.headerModel = (TeamHeaderModel *)result;
        }
    }];
}

- (void)requestDynamicData {
    
    __weak typeof(self)weakSelf = self;
    [self.viewModel queryTeamDynamicDataWithTeamId:[AppDelegate instance].userModel.teamId complete:^(UIState state, id result) {
        if (state == 1) {
            weakSelf.dynamicArray = result;
        }
    }];
}


#pragma mark - tableview delegate and datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    switch (self.selectedType) {
        case TYPE_DATA: {
            return self.statisticDict.count;
        }
        default:
            return 1;
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (self.selectedType) {
        case TYPE_STATUS: {
            return self.dynamicArray.count;
        }
            break;
        case TYPE_DATA: {
            NSString *key = [self.keys objectAtIndex:section];
            UserInfoStatisticModel *model = [self.statisticDict objectForKey:key];
            return model.isShow ? 1 : 0;
        }
            break;
        case TYPE_MEMBER: {
            return self.memberArray.count;
        }
        case TYPE_GLORY: {
            return self.gloryArray.count;
        }
        default:
            return 0;
    }
}

//TODO: type_data

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (self.selectedType) {
        case TYPE_STATUS: {
            MemberBattleCell *cell = [MemberBattleCell cellWithTableView:tableView];
            cell.model = self.dynamicArray[indexPath.row];
            return cell;
        }
            break;
        case TYPE_DATA: {
            MemberDataCell *cell = [MemberDataCell cellWithTabelView:tableView];
            
            cell.blockData = ^{
                self.testHeight = 350;
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            };
            return cell;
        }
            break;
        case TYPE_MEMBER: {
            TeamMemberCell *cell = [TeamMemberCell cellWithTableView:tableView];
            cell.model = self.memberArray[indexPath.row];
            return cell;
        }
            break;
        case TYPE_GLORY: {
            TeamGloryCell *cell = [TeamGloryCell cellWithTableView:tableView];
            cell.model = self.gloryArray[indexPath.row];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (self.selectedType) {
        case TYPE_STATUS: {
            return 90;
        }
            break;
        case TYPE_DATA: {
            return 377;
        }
            break;
        case TYPE_MEMBER: {
            return 26;
        }
            break;
        case TYPE_GLORY: {
            return 43;
        }
            break;
        default:
            return 0;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (self.selectedType) {
        case TYPE_STATUS:
            return 22;
            break;
        case TYPE_DATA:
            return 17;
            break;
        case TYPE_MEMBER:
            return 24;
            break;
        default:
            return 0;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return [self prepareHeaderView:(int)section];
}

- (UIView *)prepareHeaderView:(int)section {
    CGFloat width = self.view.bounds.size.width;
    switch (self.selectedType) {
        case TYPE_STATUS: {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 22)];
            view.backgroundColor = [UIColor ms_colorWithHexString:@"#EFEFEF"];
            UILabel *title = [UILabel labelWithTitle:@"昨天 11月 5日 周三" size:15.0 colorString:@"#000000"];
            title.center = view.center;
            [view addSubview:title];
            return view;
        }
            break;
        case TYPE_DATA: {
            UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
            header.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
            header.tag = section;
            [header addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headerClick:)]];
            
            UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
            icon.center = CGPointMake(10, header.center.y);
            [header insertSubview:icon atIndex:0];
            NSString *key = [self.keys objectAtIndex:section];
            UserInfoStatisticModel *model = [self.statisticDict objectForKey:key];
            if (model.isShow) {
                icon.transform = CGAffineTransformMakeRotation(M_PI_2);
            }
            
            UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(icon.frame) + 30, 0, 200, 20)];
            title.font = [UIFont systemFontOfSize:14.0];
            title.textColor = [UIColor darkGrayColor];
            title.text = @"2016赛季";
            [header insertSubview:title atIndex:1];
            return header;
        }
            break;
        case TYPE_MEMBER: {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 24)];
            view.backgroundColor = [UIColor whiteColor];
            NSArray *title = [NSArray arrayWithObjects:@"号码",@"名字",@"位置",@"场均", nil];
            float titleWidth = width / 4.0;
            for (int i=0; i<4; i++) {
                UILabel *label = [UILabel labelWithTitle:title[i] size:8.7 colorString:@"#8B8B8B"];
                label.frame = CGRectMake(i * titleWidth + 7, 8, titleWidth - 4, 8);
                [view addSubview:label];
                UIView *separate = [[UIView alloc] initWithFrame:CGRectMake(0, 23, width, 1)];
                separate.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
                [view addSubview:separate];
            }
            return view;
        }
            break;
        default:
            return nil;
            break;
    }
}

- (void)headerClick:(UITapGestureRecognizer *)tap {
    
    UIView *view = tap.view;
    NSString *key = [self.keys objectAtIndex:view.tag];
    UserInfoStatisticModel *model = [self.statisticDict objectForKey:key];
    model.isShow = !model.isShow;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:view.tag] withRowAnimation:UITableViewRowAnimationFade];
    
}

//- (NSMutableArray *)data {
//    
//    if (!_data) {
//        _data = [[NSMutableArray alloc] init];
//        for (int i = 0; i<3; i++) {
//            TableData *value = [[TableData alloc] init];
//            value.name = [NSString stringWithFormat:@"第%d个",i];
//            value.isShow = false;
//            [_data addObject:value];
//        }
//    }
//    return _data;
//}

@end
