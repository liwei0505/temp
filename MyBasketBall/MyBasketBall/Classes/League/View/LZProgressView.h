//
//  LZProgressView.h
//  MyBasketBall
//
//  Created by lizhe on 16/10/27.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYText.h"
@interface LZProgressView : UIView

@property (nonatomic, strong) UILabel *labelLeft;
@property (nonatomic, strong) YYLabel *labelRight;
@property (nonatomic, strong) UIView  *viewTotal;
@property (nonatomic, strong) UIView  *viewNow;

- (void)setLeftLable:(NSString *)title andFont:(UIFont *)leftFont andColor:(UIColor *)leftColor;
- (void)setRightLable:(NSMutableAttributedString *)title;
- (void)setDataWithProgress:(NSInteger)nowProgress andTotal:(NSInteger)total;


@end
