//
//  LeagueListTableViewCell.m
//  MyBasketBall
//
//  Created by lizhe on 16/10/27.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LeagueListTableViewCell.h"
#import "SDAutoLayout.h"

@implementation LeagueListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.viewHead = [[UIView alloc] init];
        self.labelTitle = [[UILabel alloc] init];
        self.viewSeperate = [[UIView alloc] init];
        self.labelTeam = [[YYLabel alloc] init];
        self.labelType = [[YYLabel alloc] init];
        self.viewProgress = [[LZProgressView alloc] init];
        self.labelTime = [[YYLabel alloc] init];
        [self.contentView addSubview:self.viewHead];
        [self.contentView addSubview:self.labelTitle];
        [self.contentView addSubview:self.viewSeperate];
        [self.contentView addSubview:self.labelTeam];
        [self.contentView addSubview:self.labelType];
        [self.contentView addSubview:self.viewProgress];
        [self.contentView addSubview:self.labelTime];
    }
    return self;
}

- (void)settingFrame {
    self.viewHead.frame = CGRectMake(-0.5, 0, SCR_W+1, 5);
    self.viewHead.layer.borderWidth = 0.5;
    self.viewHead.layer.borderColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY).CGColor;
    self.viewHead.backgroundColor = UIColorFromRGB(LZCOLOR_BACKGROUND_GRAY);
    
    self.labelTitle.font = [UIFont systemFontOfSize:text_size_large];
    self.labelTitle.textColor = UIColorFromRGB(LZCOLOR_LIGHTBLUE);
    self.labelTitle.frame = CGRectMake(LEFT_TO_SCREEN, 5, SCR_W - 2 * LEFT_TO_SCREEN, 25);
    
    self.viewSeperate.sd_layout
    .leftEqualToView(self.labelTitle)
    .rightEqualToView(self.labelTitle)
    .topSpaceToView(self.labelTitle, 2)
    .heightIs(1);
    self.viewSeperate.backgroundColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
    
    self.labelTeam.sd_layout
    .leftEqualToView(self.viewSeperate)
    .rightEqualToView(self.viewSeperate)
    .topSpaceToView(self.viewSeperate, 10)
    .heightIs(20);
    
    self.labelType.sd_layout
    .leftEqualToView(self.viewSeperate)
    .rightEqualToView(self.viewSeperate)
    .topSpaceToView(self.labelTeam, 5)
    .heightIs(20);
    
    self.viewProgress.sd_layout
    .leftEqualToView(self.viewSeperate)
    .rightEqualToView(self.viewSeperate)
    .topSpaceToView(self.labelType, 5)
    .heightIs(20);
    
    self.labelTime.sd_layout
    .leftEqualToView(self.viewSeperate)
    .rightEqualToView(self.viewSeperate)
    .topSpaceToView(self.viewProgress, 5)
    .heightIs(20);

}

- (void)settingData:(LeagueListModel *)leagueModel {
    
    
    self.labelTitle.text = leagueModel.leagueName;
    {
        NSMutableAttributedString *teamStr = [[NSMutableAttributedString alloc] initWithString:@"球队   "];
        teamStr.yy_font = [UIFont systemFontOfSize:text_size_normal];
        teamStr.yy_color = [UIColor blackColor];
        NSMutableAttributedString *teamNum = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld",leagueModel.teamNum]];
        teamNum.yy_color = UIColorFromRGB(LZCOLOR_GREEN);
        teamNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        [teamStr appendAttributedString:teamNum];
        self.labelTeam.attributedText = teamStr;
    }
    {
        NSMutableAttributedString *typeStr = [[NSMutableAttributedString alloc] initWithString:@"赛制   "];
        typeStr.yy_font = [UIFont systemFontOfSize:text_size_normal];
        typeStr.yy_color = [UIColor blackColor];
        NSString *matchType = @"";
        switch (leagueModel.leagueType) {
            case 1:
                matchType = @"3v3";
                break;
            case 2:
                matchType = @"5v5";
            default:
                matchType = @"5v5";
                break;
        }
        NSMutableAttributedString *typeNum = [[NSMutableAttributedString alloc] initWithString:matchType];
        typeNum.yy_color = UIColorFromRGB(LZCOLOR_GREEN);
        typeNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        [typeStr appendAttributedString:typeNum];
        self.labelType.attributedText = typeStr;
    }
    {
        [self.viewProgress setLeftLable:@"进度  " andFont:[UIFont systemFontOfSize:text_size_normal] andColor:[UIColor blackColor]];
        
        NSMutableAttributedString *progressNow = [[NSMutableAttributedString alloc] initWithString:@"50"];
        progressNow.yy_font = [UIFont systemFontOfSize:text_size_small];
        progressNow.yy_color = UIColorFromRGB(LZCOLOR_RED);
        NSMutableAttributedString *progressTotal = [[NSMutableAttributedString alloc] initWithString:@"/100"];
        progressTotal.yy_color = UIColorFromRGB(LZCOLOR_MAIN);
        progressTotal.yy_font = [UIFont systemFontOfSize:text_size_small];
        [progressNow appendAttributedString:progressTotal];
        [self.viewProgress setRightLable:progressNow];
        
        [self.viewProgress setDataWithProgress:50 andTotal:100];
    }
    {
        NSMutableAttributedString *timeStr = [[NSMutableAttributedString alloc] initWithString:@"时间   "];
        timeStr.yy_font = [UIFont systemFontOfSize:text_size_normal];
        timeStr.yy_color = [UIColor blackColor];
        NSString *startTime = [DateUtil DateFormatToString:[DateUtil SecondsToDate:leagueModel.startTime] WithFormat:@"YYYY-MM-dd"];
        NSString *endTime = [DateUtil DateFormatToString:[DateUtil SecondsToDate:leagueModel.endTime] WithFormat:@"YYYY-MM-dd"];
//        NSString *startTime = [DateUtil dateToString:[DateUtil SecondsToDate:leagueModel.startTime]];
//        NSString *endTime = [DateUtil dateToString:[DateUtil SecondsToDate:leagueModel.endTime]];
        NSMutableAttributedString *startTimeNum = [[NSMutableAttributedString alloc] initWithString:startTime];
        startTimeNum.yy_color = UIColorFromRGB(LZCOLOR_GREEN);
        startTimeNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        
        NSMutableAttributedString *endTimeNum = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" ~ %@",endTime]];
        endTimeNum.yy_color = UIColorFromRGB(LZCOLOR_LIGHTBLUE);
        endTimeNum.yy_font = [UIFont systemFontOfSize:text_size_normal];
        [startTimeNum appendAttributedString:endTimeNum];
        [timeStr appendAttributedString:startTimeNum];
        self.labelTime.attributedText = timeStr;
    }
    
    [self settingFrame];
}

@end
