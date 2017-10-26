//
//  AppDelegate.h
//  basketBallTemplate
//
//  Created by lizhe on 16/9/18.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property (nonatomic, strong, readonly) UserModel *userModel;

+ (AppDelegate *)instance;

@end

