//
//  MoreSubController.h
//  MyBasketBall
//
//  Created by lw on 16/12/26.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, MoreItem) {

    MORE_TEAM = 1,
    MORE_MEMBER = 2,
    MORE_LEAGUE = 3
};

@interface MoreSearchController : BaseViewController

@property (nonatomic, assign) MoreItem type;

@end
