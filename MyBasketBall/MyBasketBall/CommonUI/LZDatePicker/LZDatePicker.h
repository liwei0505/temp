//
//  LZDatePicker.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDatePickerDelegate.h"
@interface LZDatePicker : UIViewController<LZDatePickerDelegate>
@property (retain, nonatomic)  UIToolbar *toolbar;
@property (retain, nonatomic)  UIDatePicker *datePicker;
@property (nonatomic,retain) NSDate* currentDate;
@property (nonatomic, assign) id <LZDatePickerDelegate>   delegate;
-(void)show;


+(instancetype) picker;
@end
