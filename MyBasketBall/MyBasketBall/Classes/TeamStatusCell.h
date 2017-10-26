//
//  TeamStatusCell.h
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoBattleModel.h"

@interface TeamStatusCell : UITableViewCell

@property (nonatomic, strong) UserInfoBattleModel *model;
+ (TeamStatusCell *)cellWithTableView:(UITableView *)tableView;

@end
