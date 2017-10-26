//
//  LZProgressView.m
//  MyBasketBall
//
//  Created by lizhe on 16/10/27.
//  Copyright © 2016年 lizhe. All rights reserved.
//
#import "SDAutoLayout.h"
#import "LZProgressView.h"

@implementation LZProgressView

- (instancetype)init{
    if (self = [super init]) {
        self.labelLeft  = [[UILabel alloc] init];
        self.labelRight = [[YYLabel alloc] init];
        self.viewTotal  = [[UIView alloc] init];
        self.viewNow    = [[UIView alloc] init];
        [self addSubview:self.labelLeft];
        [self addSubview:self.labelRight];
        [self.viewTotal addSubview:self.viewNow];
        [self addSubview:self.viewTotal];
    }
    return self;
}

- (void)setLeftLable:(NSString *)title andFont:(UIFont *)leftFont andColor:(UIColor *)leftColor {
    if ([DataUtil isEmptyString:title]) {
        self.labelLeft.text = @"";
        self.labelLeft.frame = CGRectMake(0, 0, 50, 20);
    }else {
        self.labelLeft.text = title;
        self.labelLeft.font = leftFont;
        self.labelLeft.textColor = leftColor;
        CGSize leftSize = [self.labelLeft sizeThatFits:CGSizeMake(150, 20)];
        self.labelLeft.frame = CGRectMake(0, 0, leftSize.width, 20);
    }
}

- (void)setRightLable:(NSMutableAttributedString *)title {
    if (title == nil) {
        self.labelRight.text = @"";
        self.labelRight.frame = CGRectZero;
    }else {
        self.labelRight.attributedText = title;
        CGSize rightSize = [self.labelRight sizeThatFits:CGSizeMake(80, 20)];
        self.labelRight.sd_layout
        .rightEqualToView(self)
        .centerYEqualToView(self.labelLeft)
        .heightIs(rightSize.height)
        .widthIs(rightSize.width);
        
    }
}

- (void)setDataWithProgress:(NSInteger)nowProgress andTotal:(NSInteger)total {
    CGFloat radius = 5;
    
    self.viewTotal.backgroundColor = UIColorFromRGB(LZCOLOR_MAIN);
    self.viewTotal.layer.cornerRadius = radius;
    self.viewTotal.sd_layout
    .centerYEqualToView(self.labelLeft)
    .leftSpaceToView(self.labelLeft, 1)
    .rightSpaceToView(self.labelRight, 10)
    .heightIs(10);
    
    CGFloat nowWidthRatio = (CGFloat)nowProgress / (CGFloat)total;
    self.viewNow.backgroundColor = UIColorFromRGB(LZCOLOR_RED);
    self.viewNow.layer.cornerRadius = radius;
    self.viewNow.sd_layout
    .leftEqualToView(self.viewTotal)
    .widthRatioToView(self.viewTotal, nowWidthRatio)
    .topEqualToView(self.viewTotal)
    .heightRatioToView(self.viewTotal, 1);
}


@end
