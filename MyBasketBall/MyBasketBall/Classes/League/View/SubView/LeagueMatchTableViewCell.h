//
//  LeagueMatchTableViewCell.h
//  MyBasketBall
//
//  Created by lizhe on 16/11/7.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZProgressView.h"
#import "YYText.h"
@interface LeagueMatchTableViewCell : UITableViewCell


@property (nonatomic, strong) UIImageView *imageViewLeft;
@property (nonatomic, strong) UIImageView *imageViewRight;
@property (nonatomic, strong) YYLabel *labelScore;
@property (nonatomic, strong) UILabel *labelTime;
@property (nonatomic, strong) UILabel *labelAddress;
@property (nonatomic, strong) LZProgressView *viewProgress; //进度view

- (void)settingData;

@end
