//
//  MemberHeaderView.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "MemberHeaderView.h"
#import "UILabel+Custom.h"

@interface MemberHeaderView()

@property (nonatomic, strong) UIImageView *portraitView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *selectedView;
@property (nonatomic, strong) UIButton *selectedButton;

@end

@implementation MemberHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupHeaderView];
    }
    return self;
}

- (void)setupHeaderView {

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    UIView *content = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height - 40)];
    content.backgroundColor = [UIColor ms_colorWithHexString:@"#224FA2"];
    [self addSubview:content];
    
    self.portraitView = [[UIImageView alloc] initWithFrame:CGRectMake(width/2.0 - 30, 11, 60, 60)];
    [self.portraitView setImage:[UIImage imageNamed:@"touxiang"]];
    self.portraitView.contentMode = UIViewContentModeScaleAspectFill;
    self.portraitView.layer.masksToBounds = YES;
    self.portraitView.layer.cornerRadius = 30;
    [self addSubview:self.portraitView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.portraitView.frame) + 8, width, 12)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:12.0];
    self.titleLabel.text = @"詹姆斯｜小前锋";
    [self addSubview:self.titleLabel];
    
    UILabel *detailLabel = [UILabel labelWithTitle:@"1 比赛 3 关注 2 粉丝" size:12.0 colorString:@"#FFFFFF"];
    detailLabel.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame) + 14, width, 12);
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:detailLabel];
    
    CGFloat buttonWidth = self.bounds.size.width / 4.0;
    NSArray *buttonTitles = @[@"数据",@"对战",@"参与",@"管理"];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * buttonWidth, self.bounds.size.height - 40, buttonWidth, 40);
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [button setTitleColor:[UIColor ms_colorWithHexString:@"#8B8B8B"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor ms_colorWithHexString:@"#224FA2"] forState:UIControlStateSelected];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setTag:i];
        [button addTarget:self action:@selector(headerButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        if (!i) {
            button.selected = YES;
            self.selectedButton = button;
        }
    }
    UIView *selected = [[UIView alloc] initWithFrame:CGRectMake(0, height - 3, buttonWidth, 3)];
    selected.backgroundColor = [UIColor ms_colorWithHexString:@"#224FA2"];
    self.selectedView = selected;
    [self addSubview:self.selectedView];
    
}

- (void)headerButtonSelected:(UIButton *)sender {

    if (sender == self.selectedButton) {
        return;
    }
    
    self.selectedButton.selected = NO;
    sender.selected = !sender.selected;
    self.selectedButton = sender;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2f animations:^{
        CGFloat width = sender.bounds.size.width;
        CGPoint center = weakSelf.selectedView.center;
        center.x = sender.tag * width + width/2.0;
        weakSelf.selectedView.center = center;
    }];
    
    if ([self.delegate respondsToSelector:@selector(headerViewButtonSelectedAtIndex:)]) {
        [self.delegate headerViewButtonSelectedAtIndex:(int)sender.tag];
    }
}

@end
