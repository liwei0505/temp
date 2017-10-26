//
//  UILabel+Custom.h
//  Basketball
//
//  Created by lw on 16/11/30.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Custom)

+ (UILabel *)labelWithTitle:(NSString *)title size:(float)size colorString:(NSString *)color;
+ (UILabel *)labelWithSize:(float)size color:(NSString *)color;

@end
