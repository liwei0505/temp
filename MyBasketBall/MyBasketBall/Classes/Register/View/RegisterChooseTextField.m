//
//  RegisterChooseTextField.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "RegisterChooseTextField.h"

@implementation RegisterChooseTextField

- (instancetype)initWithNeedSetTopLine:(BOOL)top andBottom:(BOOL)bottom {
    if (self = [super init]) {
        self.needTopLine = top;
        self.needBottomLine = bottom;
        return self;
        
    }
    return nil;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    if (self.needTopLine) {
        CGContextFillRect(context, CGRectMake(0, 0.5, CGRectGetWidth(self.frame), 0.5));
    }
    if (self.needBottomLine) {
        CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
    }
    
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

@end
