//
//  MemberCell.m
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MemberBattleCell.h"

@interface MemberBattleCell()

@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *followCount;
@property (weak, nonatomic) IBOutlet UILabel *status;

@property (weak, nonatomic) IBOutlet UILabel *name1;
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *name2;
@property (weak, nonatomic) IBOutlet UILabel *score2;


@end

@implementation MemberBattleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MemberBattleCell *)cellWithTableView:(UITableView *)tableView {

    MemberBattleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_battle"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"MemberBattleCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setModel:(UserInfoBattleModel *)model {

    _model = model;
    self.time.text = model.time;
    self.address.text = model.address;
    self.followCount.text = model.focusNum;
    self.status.text = model.status;
    NSLog(@"team count:%lu",(unsigned long)model.teamArray.count);
    TeamInfo *team1 = model.teamArray[0];
    self.name1.text = team1.name;
    self.score1.text = team1.score;
    TeamInfo *team2 = model.teamArray[1];
    self.name2.text = team2.name;
    self.name2.text = team2.score;
    
}

@end
