//
//  TeamStatusCell.m
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamStatusCell.h"

@interface TeamStatusCell()

@property (weak, nonatomic) IBOutlet UILabel *name1;
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *name2;
@property (weak, nonatomic) IBOutlet UILabel *score2;


@end

@implementation TeamStatusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (TeamStatusCell *)cellWithTableView:(UITableView *)tableView {

    TeamStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_status"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"TeamStatusCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setModel:(UserInfoBattleModel *)model {

    _model = model;
    
}

@end
