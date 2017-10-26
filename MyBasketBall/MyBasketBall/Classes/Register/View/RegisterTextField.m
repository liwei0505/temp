//
//  RegisterTextField.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/24.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterTextField.h"
#import "SDAutoLayout.h"

#define HEIGHY_LEFT_RIGHT_LINE 5

@implementation RegisterTextField

- (instancetype)init {
    if (self = [super init]) {
        [self initSpecialField];
        [self setValue:UIColorFromRGB(LZCOLOR_TEXT_GRAY) forKeyPath:@"_placeholderLabel.textColor"];
//        [self setValue:[UIFont systemFontOfSize:text_size_small] forKey:@"_placeholderLabel.textColor"];
        
        return self;
    }
    return nil;
}

- (void)initSpecialField {
    UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - HEIGHY_LEFT_RIGHT_LINE, 1, HEIGHY_LEFT_RIGHT_LINE)];
    self.leftView = left;
    self.leftViewMode = UITextFieldViewModeAlways;
    left.backgroundColor = [UIColor lightGrayColor];//UIColorFromRGB(COLOR_TEXT_GRAY);
    
    
    
    
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-1, self.frame.size.height - HEIGHY_LEFT_RIGHT_LINE, 1, HEIGHY_LEFT_RIGHT_LINE)];
    [self addSubview:right];
//    right.sd_layout.rightEqualToView(self)
//    .bottomEqualToView(self)
//    .widthIs(1)
//    .heightIs(HEIGHY_LEFT_RIGHT_LINE);
    right.backgroundColor = [UIColor lightGrayColor];//UIColorFromRGB(COLOR_TEXT_GRAY);
    self.rightView = right;
    self.rightViewMode = UITextFieldViewModeAlways;
    
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, UIColorFromRGB(COLOR_TEXT_GRAY).CGColor);
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}

// 修改文本展示区域，一般跟editingRectForBounds一起重写
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width-20, bounds.size.height);//更好理解些
    return inset;
}

// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width-20, bounds.size.height);//更好理解些
    return inset;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    CGFloat height = self.frame.size.height;
    CGFloat needMoveY = height  - (iconRect.origin.y + iconRect.size.height);
    iconRect.origin.y += needMoveY;//
    return iconRect;
}
- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super rightViewRectForBounds:bounds];
    CGFloat height = self.frame.size.height;
    CGFloat needMoveY = height  - (iconRect.origin.y + iconRect.size.height);
    iconRect.origin.y += needMoveY;//
    return iconRect;
}

@end
