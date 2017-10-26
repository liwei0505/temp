//
//  RegisterChooseTextField.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterChooseTextField : UITextField

@property (nonatomic, assign)BOOL needTopLine;
@property (nonatomic, assign)BOOL needBottomLine;

- (instancetype)initWithNeedSetTopLine:(BOOL)top andBottom:(BOOL)bottom;

@end
