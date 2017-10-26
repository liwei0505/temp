//
//  PersonalInfoCell.h
//  MyBasketBall
//
//  Created by lee on 16/12/16.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineInfoCell : UITableViewCell

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *value;

+ (MineInfoCell *)cellWithTableView:(UITableView *)tableView;

@end
