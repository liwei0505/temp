//
//  BattleHeaderView.m
//  MyBasketBall
//
//  Created by lw on 17/1/18.
//  Copyright © 2017年 lizhe. All rights reserved.
//

#import "BattleHeaderView.h"

@implementation BattleHeaderView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        UINib *nib =[UINib nibWithNibName:@"BattleHeaderView" bundle:nil];
        BattleHeaderView *view = [nib instantiateWithOwner:nil options:nil].lastObject;
        view.frame = frame;
        self = view;
    }
    return self;
}

- (void)setModel:(BattleHeaderModel *)model {
    
    self.model = model;
}

@end
