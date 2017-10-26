//
//  MessageCell.h
//  MyBasketBall
//
//  Created by lw on 16/12/15.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;

+ (MessageCell *)cellWithTableView:(UITableView *)tableView;

@end
