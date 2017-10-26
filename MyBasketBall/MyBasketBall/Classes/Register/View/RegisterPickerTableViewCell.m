//
//  RegisterPickerTableViewCell.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterPickerTableViewCell.h"

@implementation RegisterPickerTableViewCell

-(instancetype)init{
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RegisterPickerTableViewCell"];
    if (self) {
//        _textfield=[[RPFloatingPlaceholderTextField alloc]initWithFrame:CGRectMake(10, 5, 280, 44)];
//        _textfield.animationDirection =RPFloatingPlaceholderAnimateDownward;
//        _textfield.floatingLabelActiveTextColor = hintColor;
//        _textfield.floatingLabelInactiveTextColor = hintColor;
//        _textfield.font=[UIFont systemFontOfSize:text_size_small];
//        _textfield.floatingLabel.font = [UIFont systemFontOfSize:text_size_normal];
//        _textfield.userInteractionEnabled=NO;
//        _textfield.keyboardType=UIKeyboardTypeNumberPad;
//        [self.contentView addSubview:_textfield];
        _edit = YES;
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



-(void) setLabelText:(id) content{
    if(_edit){
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }else{
        self.accessoryType=UITableViewCellAccessoryNone;
    }
    
   }
-(void)choose{
    if(!_edit)
        return;
    LZPickerNum* picker=[LZPickerNum picker];
    picker.delegate=self;
    
    [picker show];
}
#pragma contentChangeDelegate



#pragma CtsiDatePickerDelegate


#pragma validate

- (void)drawBottomLine{
    UILabel *drawLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 65 - 2 , SCR_W - 2 *10, 0.5)];
    [drawLabel setBackgroundColor:Color_Border_Custom];
    [self.contentView addSubview:drawLabel];
    
}
@end
