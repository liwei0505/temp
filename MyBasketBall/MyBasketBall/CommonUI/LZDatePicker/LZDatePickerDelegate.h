//
//  LZDatePickerDelegate.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#ifndef LZDatePickerDelegate_h
#define LZDatePickerDelegate_h


@protocol LZDatePickerDelegate <NSObject>

-(void)onDatePickerChoose:(NSDate*) date;

- (void)onNumPickerChoose:(NSNumber *) num;
@end


#endif /* LZDatePickerDelegate_h */
