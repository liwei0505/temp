//
//  BaseViewModel.h
//  mts-iphone
//
//  Created by lizhe on 16/7/13.
//  Copyright © 2016年 中国电信. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelDefine.h"
typedef void (^BlockNotify)(UIState state, id result);

@interface BaseViewModel : NSObject
/**
 *用于VM把事件通知给VC 由VC实现
 */
@property (nonatomic, copy) BlockNotify BlockUIChange;

@end
