//
//  SearchMemberCell.h
//  MyBasketBall
//
//  Created by lw on 16/12/31.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchLeagueCell : UITableViewCell

@property (nonatomic, strong) NSArray *model;
@property (nonatomic, copy) void(^followBlock)(void);
+ (SearchLeagueCell *)cellWithTableView:(UITableView *)tableView;

@end
