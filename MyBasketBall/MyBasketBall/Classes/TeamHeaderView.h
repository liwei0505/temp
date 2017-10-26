//
//  TeamHeaderView.h
//  Basketball
//
//  Created by lw on 16/11/26.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamHeaderModel.h"

@protocol TeamHeaderViewButtonSelectedDelegate <NSObject>

- (void)headerViewButtonSelectedAtIndex:(int)index;

@end

@interface TeamHeaderView : UIView

@property (nonatomic,weak) id<TeamHeaderViewButtonSelectedDelegate> delegate;
@property (nonatomic, strong) TeamHeaderModel *headerModel;
@property (nonatomic, copy) void(^followBlock)(void);
@property (nonatomic, strong) UIButton *follow;

@end
