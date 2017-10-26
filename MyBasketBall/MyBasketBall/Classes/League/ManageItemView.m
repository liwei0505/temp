//
//  ManageItemView.m
//  MyBasketBall
//
//  Created by lw on 17/2/3.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "ManageItemView.h"

@interface ManageItemView()
@property (nonatomic, strong) UIView *line;
@end

@implementation ManageItemView

- (instancetype)initWithFrame:(CGRect)frame {

    float height = frame.size.height;
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return self;
}

@end
