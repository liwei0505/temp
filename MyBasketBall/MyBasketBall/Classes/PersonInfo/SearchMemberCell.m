//
//  SearchMemberCell.m
//  MyBasketBall
//
//  Created by lw on 17/1/1.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "SearchMemberCell.h"

@interface SearchMemberCell()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *deatilLabel;
@property (nonatomic, strong) UIView *line;

@end
@implementation SearchMemberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (SearchMemberCell *)cellWithTableView:(UITableView *)tableView {
    
    NSString *cellId = @"cell_search_member";
    SearchMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SearchMemberCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconImageView = [[UIImageView alloc] init];
        self.iconImageView.layer.cornerRadius = 18;
        self.iconImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLabel = [UILabel labelWithSize:12 color:@"#000000"];
        [self.contentView addSubview:self.titleLabel];
        
        self.deatilLabel = [UILabel labelWithSize:12 color:@"#8B8B8B"];
        [self.contentView addSubview:self.deatilLabel];
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
        [self.contentView addSubview:self.line];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(36)]" options:0 metrics:nil views:@{@"icon":self.iconImageView}]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:36]];
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.iconImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:5]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-10]];
    
    self.deatilLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.deatilLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.iconImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:5]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.deatilLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:10]];
    
    self.line.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[line]-0-|" options:0 metrics:nil views:@{@"line":self.line}]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
}

- (void)setModel:(NSArray *)model {
    
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:_model[0]];
    self.titleLabel.text = _model[1];
    self.deatilLabel.text = _model[2];
}

@end
