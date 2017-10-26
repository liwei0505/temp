//
//  TeamMessageViewModel.m
//  MyBasketBall
//
//  Created by lw on 17/1/29.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "TeamMessageViewModel.h"
#import "GetTeamInfoHeadThread.h"
#import "GetTeamInfoFollowThread.h"
#import "GetTeamInfoDynamicThread.h"
#import "GetTeamInfoStatisticThread.h"
#import "GetTeamInfoMemberThread.h"
#import "GetTeamInfoGloryThread.h"
#import "TeamHeaderModel.h"
#import "UserInfoBattleModel.h"
#import "UserInfoStatisticModel.h"
#import "TeamMemberModel.h"
#import "TeamGloryModel.h"

@implementation TeamMessageViewModel

- (void)queryTeamHeaderWithUserId:(int)userId teamId:(int)teamId complete:(BlockNotify)block {

    GetTeamInfoHeadThread *headThread = [[GetTeamInfoHeadThread alloc] initWithUserId:userId teamId:teamId];
    [headThread requireonPrev:^{
    } success:^(NSInteger status, NSDictionary *dic) {
        if (dic) {
            TeamHeaderModel *model = [[TeamHeaderModel alloc] initWithDict:dic];
            block(status, model);
        } else {
            block(status, nil);
        }
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];
    
}

- (void)queryTeamFollowWithUserId:(int)userId teamId:(int)teamId complete:(BlockNotify)block {

    GetTeamInfoFollowThread *follow = [[GetTeamInfoFollowThread alloc] initWithUserId:userId teamId:teamId];
    [follow requireonPrev:^{
    } success:^(NSInteger status) {
        block(status, nil);
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];
    
}

- (void)queryTeamDynamicDataWithTeamId:(int)teamId complete:(BlockNotify)block {

    GetTeamInfoDynamicThread *dynamic = [[GetTeamInfoDynamicThread alloc] initWithTeamId:[AppDelegate instance].userModel.teamId];
    [dynamic requireonPrev:^{
    } success:^(NSInteger status, NSArray *dic) {
        
        if (dic) {
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:dic.count];
            for (NSDictionary *dict in dic) {
                UserInfoBattleModel *model = [[UserInfoBattleModel alloc] initWithDict:dict];
                [array addObject:model];
            }
            block(status, array);
        } else {
            block(status, nil);
        }
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];
}

- (void)queryTeamStatisticWithTeamId:(int)teamId complete:(BlockNotify)block {

    GetTeamInfoStatisticThread *statistic = [[GetTeamInfoStatisticThread alloc] initWithTeamId:[AppDelegate instance].userModel.teamId];
    [statistic requireonPrev:^{
    } success:^(NSInteger status, NSDictionary *dic) {
        
        if (status == 1 && dic.count) {
            UserInfoStatisticModel *model = [[UserInfoStatisticModel alloc] initWithDict:dic];
            block(status, model);
        } else {
            block(status, nil);
        }
        
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];

}

- (void)queryTeamMemberWithTeamId:(int)teamId complete:(BlockNotify)block {

    GetTeamInfoMemberThread *member = [[GetTeamInfoMemberThread alloc] initWithTeamId:[AppDelegate instance].userModel.teamId];
    [member requireonPrev:^{
    } success:^(NSInteger status, NSArray *dic) {
        
        if (status == 1) {
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:dic.count];
            for (NSDictionary *dict in dic) {
                TeamMemberModel *model = [[TeamMemberModel alloc] initWithDict:dict];
                [array addObject:model];
            }
            block(status, array);
        } else {
            block(status, nil);
        }
        
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];
    
}

- (void)queryTeamGloryWithTeamId:(int)teamId complete:(BlockNotify)block {

    GetTeamInfoGloryThread *glory = [[GetTeamInfoGloryThread alloc] initWithTeamId:[AppDelegate instance].userModel.teamId];
    [glory requireonPrev:^{
    } success:^(NSInteger status, NSArray *dic) {
        
        if (status == 1) {
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:dic.count];
            for (NSDictionary *dict in dic) {
                TeamGloryModel *model = [[TeamGloryModel alloc] initWithDict:dict];
                [array addObject:model];
            }
            block(status, array);
        } else {
            block(status, nil);
        }
        
    } unavaliableNetwork:^{
    } timeout:^{
    } exception:^(NSString *message) {
    }];

}

@end
