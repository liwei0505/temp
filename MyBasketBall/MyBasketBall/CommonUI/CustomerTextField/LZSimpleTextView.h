//
//  LZSimpleTextView.h
//  MyBasketBall
//
//  Created by lizhe on 16/11/8.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZSimpleTextView : UIView<UITextViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UILabel *labelContentLength;


- (instancetype)initWithTitle:(NSString *)title andEditAble:(BOOL)editAble andMaxLength:(NSInteger)maxLength andPlaceHolder:(NSString *)placeHolder;

- (void)setTextViewContent:(NSString *)content;
@end
