//
//  LeagueListTableViewCell.h
//  MyBasketBall
//
//  Created by lizhe on 16/10/27.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeagueListModel.h"
#import "YYText.h"
#import "LZProgressView.h"
@interface LeagueListTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView  *viewHead;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIView  *viewSeperate;
@property (nonatomic, strong) YYLabel *labelTeam;
@property (nonatomic, strong) YYLabel *labelType;   //赛制
@property (nonatomic, strong) LZProgressView *viewProgress; //进度view
@property (nonatomic, strong) YYLabel *labelTime;

- (void)settingData:(LeagueListModel *)leagueModel;



@end
