//
//  MyCustomTextField.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/19.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "MyCustomTextField.h"

@implementation MyCustomTextField

// 修改文本展示区域，一般跟editingRectForBounds一起重写
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+20, bounds.origin.y, bounds.size.width-25, bounds.size.height);//更好理解些
    return inset;
}

// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+20, bounds.origin.y, bounds.size.width-25, bounds.size.height);//更好理解些
    return inset;
}

/*
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 5, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, 5, 0);
}
*/
@end

