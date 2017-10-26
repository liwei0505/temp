//
//  TeamMemberCell.h
//  Basketball
//
//  Created by lw on 16/11/27.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMemberModel.h"

@interface TeamMemberCell : UITableViewCell

@property (nonatomic, strong) TeamMemberModel *model;
+ (TeamMemberCell *)cellWithTableView:(UITableView *)tableView;

@end
