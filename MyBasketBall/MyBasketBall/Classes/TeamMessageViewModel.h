//
//  TeamMessageViewModel.h
//  MyBasketBall
//
//  Created by lw on 17/1/29.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "BaseViewModel.h"

@interface TeamMessageViewModel : BaseViewModel

- (void)queryTeamHeaderWithUserId:(int)userId teamId:(int)teamId complete:(BlockNotify)block;
- (void)queryTeamFollowWithUserId:(int)userId teamId:(int)teamId complete:(BlockNotify)block;
- (void)queryTeamDynamicDataWithTeamId:(int)teamId complete:(BlockNotify)block;
- (void)queryTeamStatisticWithTeamId:(int)teamId complete:(BlockNotify)block;
- (void)queryTeamMemberWithTeamId:(int)teamId complete:(BlockNotify)block;
- (void)queryTeamGloryWithTeamId:(int)teamId complete:(BlockNotify)block;

@end
