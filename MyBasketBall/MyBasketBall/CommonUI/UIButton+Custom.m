//
//  UIButton+Custom.m
//  Basketball
//
//  Created by lw on 16/12/5.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "UIButton+Custom.h"
#import "UIColor+StringColor.h"

@implementation UIButton (Custom)

+ (UIButton *)textButtonWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(NSString *)titleColor {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:size]];
    button.titleLabel.numberOfLines = 0;
    [button setTitleColor:[UIColor ms_colorWithHexString:titleColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    return button;
}

+ (UIButton *)colorButtonWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(NSString *)titleColor backgroundColor:(NSString *)backColor {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor ms_colorWithHexString:backColor]];
    [button setTitleColor:[UIColor ms_colorWithHexString:titleColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:size]];
    button.titleLabel.numberOfLines = 0;
    return button;
}

@end
