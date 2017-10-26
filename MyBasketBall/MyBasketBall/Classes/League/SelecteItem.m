//
//  SelecteItem.m
//  MyBasketBall
//
//  Created by lw on 17/2/12.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "SelecteItem.h"

@interface SelecteItem()

@property (strong, nonatomic) UILabel *lbTitle;
@property (strong, nonatomic) UITextField *txtfSelected;

@end

@implementation SelecteItem

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        [self initSelf];
    }
    return self;
}

- (void)initSelf {

    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:17];
    self.lbTitle = label;
    [self addSubview:self.lbTitle];
    

}

//+ (instancetype)initWithTitle:(NSString *)title selectItems:(NSArray *)array {
//
//    
//}

@end
