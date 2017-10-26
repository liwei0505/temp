//
//  MemberJoinCell.m
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MemberJoinCell.h"

@implementation MemberJoinCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MemberJoinCell *)cellWithTableView:(UITableView *)tableView {

    MemberJoinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_join"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"MemberJoinCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
