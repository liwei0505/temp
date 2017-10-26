//
//  MoreTableCell.m
//  MyBasketBall
//
//  Created by lw on 16/12/17.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MoreTableCell.h"
#import "SDAutoLayout.h"

@interface MoreTableCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UIView *line;

@end

@implementation MoreTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (MoreTableCell *)cellWithTableView:(UITableView *)tableView {

    NSString *cellId = @"cell_more";
    MoreTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MoreTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
        self.iconImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconImage];
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
        [self.contentView addSubview:self.line];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, 20)
    .centerYEqualToView(self.contentView)
    .heightIs(20)
    .widthIs(40);
    
    self.iconImage.sd_layout
    .centerYEqualToView(self.contentView)
    .rightSpaceToView(self.contentView, 20)
    .heightIs(20)
    .widthIs(20);
    
    self.line.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .heightIs(0.5);
    
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

@end
