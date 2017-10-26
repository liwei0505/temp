//
//  UILabel+Custom.m
//  Basketball
//
//  Created by lw on 16/11/30.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "UILabel+Custom.h"
#import "UIColor+StringColor.h"

@implementation UILabel (Custom)

+ (UILabel *)labelWithTitle:(NSString *)title size:(float)size colorString:(NSString *)color {

    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = [UIColor ms_colorWithHexString:color];
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
    
}

+ (UILabel *)labelWithSize:(float)size color:(NSString *)color {

    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor ms_colorWithHexString:color];
    label.font = [UIFont systemFontOfSize:size];
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
    
}

@end
