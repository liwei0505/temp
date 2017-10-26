//
//  SearchMemberCell.m
//  MyBasketBall
//
//  Created by lw on 16/12/31.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "SearchLeagueCell.h"
#import "UIButton+Custom.h"

@interface SearchLeagueCell()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIButton *followButton;
@property (nonatomic, strong) UIView *line;

@end

@implementation SearchLeagueCell

+ (SearchLeagueCell *)cellWithTableView:(UITableView *)tableView {

    NSString *cellId = @"cell_search_league";
    SearchLeagueCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SearchLeagueCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
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
        
        self.statusLabel = [UILabel labelWithSize:10 color:@"#8B8B8B"];
        [self.contentView addSubview:self.statusLabel];
        
        self.countLabel = [UILabel labelWithSize:10 color:@"#8B8B8B"];
        [self.contentView addSubview:self.countLabel];
        
        self.followButton = [UIButton textButtonWithTitle:@"关注" fontSize:10 titleColor:@"#8B8B8B"];
        [self.followButton addTarget:self action:@selector(followButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.followButton];
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = [UIColor ms_colorWithHexString:@"#D8D8D8"];
        [self.contentView addSubview:self.line];
                           
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(36)]" options:0 metrics:nil views:@{@"icon":self.iconImageView}]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.iconImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:36]];
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.iconImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:5]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-10]];
    
    self.statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.statusLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.iconImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:5]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.statusLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:10]];

    self.countLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.countLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.statusLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.countLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.statusLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:10]];
    
    self.followButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.followButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.countLabel attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.followButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.countLabel attribute:NSLayoutAttributeRight multiplier:1.0 constant:10]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.followButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40]];
    
    self.line.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[line]-0-|" options:0 metrics:nil views:@{@"line":self.line}]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
}

- (void)followButtonClick {

    if (self.followBlock) {
        self.followBlock();
    }
}

- (void)setModel:(NSArray *)model {

    _model = model;
    self.iconImageView.image = [UIImage imageNamed:_model[0]];
    self.titleLabel.text = _model[1];
    self.statusLabel.text = _model[2];
    self.countLabel.text = _model[3];
    [self.followButton setTitle:_model[4] forState:UIControlStateNormal];
    
}

@end
