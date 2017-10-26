//
//  TeamGloryCell.h
//  Basketball
//
//  Created by lw on 16/11/27.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamGloryModel.h"

@interface TeamGloryCell : UITableViewCell

@property (nonatomic, strong) TeamGloryModel *model;
+ (TeamGloryCell *)cellWithTableView:(UITableView *)tableView;

@end
