//
//  PersonalInfoCell.m
//  MyBasketBall
//
//  Created by lee on 16/12/16.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MineInfoCell.h"
#import "SDAutoLayout.h"

@interface MineInfoCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation MineInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MineInfoCell *)cellWithTableView:(UITableView *)tableView {

    NSString *cellId = @"personal_cell";
    MineInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MineInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        
        self.valueLabel = [[UILabel alloc] init];
        self.valueLabel.textColor = [UIColor blackColor];
        self.valueLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.valueLabel];
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.line];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    float width = self.contentView.bounds.size.width;
    self.titleLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .leftSpaceToView(self.contentView, 20)
    .widthIs(80)
    .heightIs(20);
    
    self.valueLabel.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, 20)
    .widthIs(width/2)
    .heightIs(20);
    
    self.line.sd_layout.leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomSpaceToView(self.contentView, 0)
    .heightIs(1);
    
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setValue:(NSString *)value {
    _valueLabel.text = value;
}
                
@end
