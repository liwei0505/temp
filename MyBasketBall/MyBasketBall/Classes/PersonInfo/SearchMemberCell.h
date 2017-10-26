//
//  SearchMemberCell.h
//  MyBasketBall
//
//  Created by lw on 17/1/1.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchMemberCell : UITableViewCell

@property (nonatomic, strong) NSArray *model;

+ (SearchMemberCell *)cellWithTableView:(UITableView *)tableView;

@end
