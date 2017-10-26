//
//  TeamGloryCell.m
//  Basketball
//
//  Created by lw on 16/11/27.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "TeamGloryCell.h"

@interface TeamGloryCell()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *glory;

@end

@implementation TeamGloryCell

+ (TeamGloryCell *)cellWithTableView:(UITableView *)tableView {

    TeamGloryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_glory"];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:@"TeamGloryCell" bundle:nil];
        cell = [nib instantiateWithOwner:nil options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setModel:(TeamGloryModel *)model {

    _model = model;
    self.name.text = [NSString stringWithFormat:@"%@(%@)",model.name,model.year];
    self.glory.text = model.glory;
    
}

@end
