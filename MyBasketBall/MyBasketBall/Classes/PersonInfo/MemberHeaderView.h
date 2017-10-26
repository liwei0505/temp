//
//  MemberHeaderView.h
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MemberHeaderViewButtonSelectedDelegate <NSObject>

- (void)headerViewButtonSelectedAtIndex:(int)index;

@end


@interface MemberHeaderView : UIView

@property (nonatomic, strong) NSString *portrait;
@property (nonatomic, weak) id<MemberHeaderViewButtonSelectedDelegate> delegate;

@end
