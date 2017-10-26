//
//  LeagueMatchTableViewCell.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LeagueMatchTableViewCell.h"
#import "SDAutoLayout.h"
@implementation LeagueMatchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageViewLeft = [[UIImageView alloc] init];
        self.imageViewRight = [[UIImageView alloc] init];
        self.labelScore = [[YYLabel alloc] init];
        self.labelTime = [[UILabel alloc] init];
        self.labelAddress = [[UILabel alloc] init];
        self.viewProgress = [[LZProgressView alloc] init];
        
        [self.contentView addSubview:self.imageViewLeft];
        [self.contentView addSubview:self.imageViewRight];
        [self.contentView addSubview:self.labelScore];
        [self.contentView addSubview:self.labelTime];
        [self.contentView addSubview:self.labelAddress];
        [self.contentView addSubview:self.viewProgress];
    }
    return self;
}

- (void)settingFrame {
    CGFloat imageViewWidth = 50;
    self.imageViewLeft.frame = CGRectMake(LEFT_TO_SCREEN, 5, imageViewWidth, imageViewWidth);
    self.imageViewLeft.layer.cornerRadius = imageViewWidth / 2;
    self.imageViewLeft.layer.borderColor = UIColorFromRGB(LZCOLOR_RED).CGColor;
    self.imageViewLeft.layer.borderWidth = 1;

    self.imageViewRight.frame = CGRectMake(SCR_W - imageViewWidth - LEFT_TO_SCREEN, 5, imageViewWidth, imageViewWidth);
    self.imageViewRight.layer.cornerRadius = imageViewWidth / 2;
    self.imageViewRight.layer.borderColor = UIColorFromRGB(LZCOLOR_MAIN).CGColor;
    self.imageViewRight.layer.borderWidth = 1;
    
    self.labelScore.sd_layout
    .leftSpaceToView(self.imageViewLeft,50)
    .rightSpaceToView(self.imageViewRight, 50)
    .topEqualToView(self.imageViewLeft)
    .heightIs(20);
    self.labelScore.textAlignment = NSTextAlignmentCenter;
    
    self.labelTime.sd_layout
    .topSpaceToView(self.labelScore,0)
    .centerXEqualToView(self.labelScore)
    .widthIs(80)
    .heightIs(20);
    self.labelTime.textAlignment = NSTextAlignmentCenter;
    self.labelTime.textColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
    self.labelTime.font = [UIFont systemFontOfSize:text_size_small];
    
    self.labelAddress.sd_layout
    .topSpaceToView(self.labelTime,0)
    .centerXEqualToView(self.labelTime)
    .widthIs(SCR_W - 2*LEFT_TO_SCREEN - 2*imageViewWidth)
    .heightIs(20);
    self.labelAddress.textAlignment = NSTextAlignmentCenter;
    self.labelAddress.textColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
    self.labelAddress.font = [UIFont systemFontOfSize:text_size_small];
    
//    self.viewProgress.frame = CGRectMake(LEFT_TO_SCREEN, 70, SCR_W - 2 *LEFT_TO_SCREEN, 20);
    self.viewProgress.sd_layout
    .topSpaceToView(self.labelAddress, 5)
    .leftEqualToView(self.imageViewLeft)
    .rightEqualToView(self.imageViewRight)
    .heightIs(20);
}

- (void)settingData {
    
    [self settingFrame];
    
    {
        NSMutableAttributedString *scoreLeft = [[NSMutableAttributedString alloc] initWithString:@"50  "];
        scoreLeft.yy_font = [UIFont systemFontOfSize:text_size_normal];
        scoreLeft.yy_color = UIColorFromRGB(LZCOLOR_RED);
        
        NSMutableAttributedString *scoreRight = [[NSMutableAttributedString alloc] initWithString:@"  100"];
        scoreRight.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        scoreRight.yy_font = [UIFont systemFontOfSize:text_size_normal];
        
        NSMutableAttributedString *scoreVS = [[NSMutableAttributedString alloc] initWithString:@"VS"];
        scoreVS.yy_color = UIColorFromRGB(LZCOLOR_GREEN);
        scoreVS.yy_font = [UIFont systemFontOfSize:text_size_huge];
        
        [scoreLeft appendAttributedString:scoreVS];
        [scoreLeft appendAttributedString:scoreRight];
        self.labelScore.attributedText =  scoreLeft;
    }
    {
        NSDate *now = [NSDate date];
        NSString *date = [DateUtil DateFormatToString:now WithFormat:@"MM-dd"];
        self.labelTime.text = date;
    }
    {
        self.labelAddress.text = @"地址地址地址";
    }
    {
        [self.viewProgress setLeftLable:@"球队名称" andFont:[UIFont systemFontOfSize:text_size_small] andColor:UIColorFromRGB(LZCOLOR_RED)];
        NSMutableAttributedString *right = [[NSMutableAttributedString alloc] initWithString:@"有一个球队名称"];
        right.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        right.yy_font = [UIFont systemFontOfSize:text_size_small];
        [self.viewProgress setRightLable:right];
        [self.viewProgress setDataWithProgress:50 andTotal:150];
    }
    
}

@end
