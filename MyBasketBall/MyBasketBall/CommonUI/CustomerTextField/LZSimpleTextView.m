//
//  LZSimpleTextView.m
//  MyBasketBall
//
//  Created by lizhe on 16/11/8.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LZSimpleTextView.h"
#import "SDAutoLayout.h"
@interface LZSimpleTextView()
{
    NSInteger _maxLength;
    NSString *_placeholder;
    NSString *_title;
    BOOL     _editAble;
}
@end

@implementation LZSimpleTextView

- (instancetype)initWithTitle:(NSString *)title andEditAble:(BOOL)editAble andMaxLength:(NSInteger)maxLength andPlaceHolder:(NSString *)placeHolder {
    if (self = [super init]) {
        _maxLength = maxLength;
        _title = title;
        _placeholder = placeHolder;
        _editAble = editAble;
        [self initTextViewData];
        [self initTextViewFrame];
        return self;
    }
    return nil;
}

- (void)initTextViewData {
    //label
    self.labelTitle = [[UILabel alloc] init];
    self.labelTitle.text = _title;
    self.labelTitle.font = [UIFont systemFontOfSize:text_size_normal];
    [self addSubview:self.labelTitle];
    
    //contentLengthLabel
    self.labelContentLength = [[UILabel alloc] init];
    NSString *contentString = [NSString stringWithFormat:@"0/%ld",(long)_maxLength];
    self.labelContentLength.text = contentString;
    [self.labelContentLength setTextColor:UIColorFromRGB(LZCOLOR_MAIN)];
    [self.labelContentLength setFont:[UIFont systemFontOfSize:text_size_small]];
    [self addSubview:self.labelContentLength];
    self.labelContentLength.textAlignment = NSTextAlignmentRight;
    
    
    //textView
//    self.textView.text = _placeholder;  //当输入框没有内容时，水印提示 提示内容为
    self.textView = [[UITextView alloc] init];
    self.textView.font = [UIFont systemFontOfSize:text_size_normal];
    self.textView.textColor = UIColorFromRGB(LZCOLOR_TEXT_GRAY);
    self.textView.delegate = self;
    [self addSubview:self.textView];

    if (_editAble == NO) {
        [self.labelContentLength setHidden:YES];
        [self.textView setEditable:NO];
    }
}

- (void)initContentLengthFrame {
    
    CGSize contentLengthSize = [self.labelContentLength sizeThatFits:CGSizeMake(40,10)];
    float contentLengthX = self.bounds.size.width - contentLengthSize.width;
    float contentLengthY = 0 ;
    [self.labelContentLength setFrame:CGRectMake(contentLengthX, contentLengthY, contentLengthSize.width, contentLengthSize.height)];
    
}

- (void)initTextViewFrame {
    self.labelTitle.frame = CGRectMake(0, 0, 100, 20);
    
    self.labelContentLength.sd_layout
    .rightEqualToView(self)
    .centerYEqualToView(self.labelTitle)
    .widthIs(50)
    .heightIs(20);
    
    self.textView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(self.labelTitle, 0)
    .bottomEqualToView(self);
}

- (void)setTextViewContent:(NSString *)content {
    self.textView.text = content;
    [self.textView setContentOffset:CGPointZero animated:NO];
    [self updateLayout];
}

#pragma mark -
#pragma mark UItextView Delegate
- (void)textViewDidChange:(UITextView *)textView {
    NSInteger number = [textView.text length];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        
        NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
        
        if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [textView markedTextRange];
            //高亮wenzi文字
            UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
            
            // 假如没有高亮选择的字，则对已输入的文字进行字数统计和限制
            
            if (!selectedRange) {
                
                if (number > _maxLength) {
                    textView.text = [textView.text substringToIndex:_maxLength];
                    number = _maxLength;
                    
                }
                self.labelContentLength.text = [NSString stringWithFormat:@"%ld/%ld",(long)number,(long)_maxLength];
            }
            else{
                // 有高亮选择的字符串，则暂不对文字进行统计和限制
            }
        }
        // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        else{
            
            if (number > _maxLength) {
                
                textView.text = [textView.text substringToIndex:_maxLength];
                number = _maxLength;
            }
            self.labelContentLength.text = [NSString stringWithFormat:@"%ld/%ld",(long)number,(long)_maxLength];
            
        }
    }
    else {
        
        
        
    }
    
    
    [self initContentLengthFrame];
}


@end
