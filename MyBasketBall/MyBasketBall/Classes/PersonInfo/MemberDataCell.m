//
//  MemberDataCell.m
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MemberDataCell.h"

@interface MemberDataCell()

@property (weak, nonatomic) IBOutlet UIButton *loadData;


@end

@implementation MemberDataCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.loadData addTarget:self action:@selector(loadMoreData) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MemberDataCell *)cellWithTabelView:(UITableView *)tableView {

    MemberDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_data"];
    if (!cell) {
        UINib *nib= [UINib nibWithNibName:@"MemberDataCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)loadMoreData {
    if (self.blockData) {
        self.blockData();
    }
}

@end
