//
//  MemberDataCell.h
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberDataCell : UITableViewCell

+ (MemberDataCell *)cellWithTabelView:(UITableView *)tableView;
//- (void)loadMoreData:(void(^)(void))click;
@property(nonatomic, copy) void(^blockData)();

@end
