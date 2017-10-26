//
//  RegisterPickerTableViewCell.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateContentDelegate.h"
#import "LZPickerNum.h"
#import "LZDatePickerDelegate.h"
@interface RegisterPickerTableViewCell : UITableViewCell<TemplateContentDelegate,LZDatePickerDelegate>
{
    BOOL _edit;
}

-(instancetype)init;

- (void)drawBottomLine;

-(void)choose;

@end
