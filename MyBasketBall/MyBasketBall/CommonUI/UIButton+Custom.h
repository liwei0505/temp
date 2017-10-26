//
//  UIButton+Custom.h
//  Basketball
//
//  Created by lw on 16/12/5.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)

+ (UIButton *)textButtonWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(NSString *)titleColor;
+ (UIButton *)colorButtonWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(NSString *)titleColor backgroundColor:(NSString *)backColor;

@end
