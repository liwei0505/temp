//
//  LZPickerNum.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZDatePickerDelegate.h"
@interface LZPickerNum : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (retain, nonatomic)  UIToolbar *toolbar;
@property (retain, nonatomic)  UIPickerView *pickerView;

@property (nonatomic, assign) id <LZDatePickerDelegate>   delegate;
-(void)show;


+(instancetype) picker;

@end
