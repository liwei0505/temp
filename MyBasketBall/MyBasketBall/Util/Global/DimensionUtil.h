//
//  DimensionUtil.h
//  mts-iphone
//
//  Created by 李曜 on 15/4/16.
//  Copyright (c) 2015年 中国电信. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Availability.h>

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion]compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion]compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice]systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion]compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice]systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


static CGFloat font_size_navigation_title;
static CGFloat font_size_navigation_item;
static CGFloat font_size_segment_title;
static CGFloat font_size_text_huge;
static CGFloat font_size_text_large;
static CGFloat font_size_text_normal;
static CGFloat font_size_text_small;
static CGFloat font_size_text_smaller;
static CGFloat font_size_text_tiny;

@interface DimensionUtil : NSObject

+(CGFloat) ViewPositionY:(UIView *) view;

+(CGFloat) calculateTextHeight:(UIFont *)font givenText:(NSString *)text givenWidth:(NSInteger)width;

+ (void)setFontByDevice;
@end
