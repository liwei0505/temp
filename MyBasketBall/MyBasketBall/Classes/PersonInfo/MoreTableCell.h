//
//  MoreTableCell.h
//  MyBasketBall
//
//  Created by lw on 16/12/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTableCell : UITableViewCell

@property (nonatomic, copy) NSString *title;
+ (MoreTableCell *)cellWithTableView:(UITableView *)tableView;

@end
