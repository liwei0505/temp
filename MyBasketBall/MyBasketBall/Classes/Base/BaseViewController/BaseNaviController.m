//
//  BaseNaviController.m
//  Basketball
//
//  Created by lw on 16/11/24.
//  Copyright © 2016年 basketball. All rights reserved.
//

#import "BaseNaviController.h"
#import "UIColor+StringColor.h"
#import "UIImage+color.h"
@interface BaseNaviController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor ms_colorWithHexString:@"#224FA2"];
    [self setNavigationBar];
    
//    [navigationBar setShadowImage:image];
//    [navigationBar setBarTintColor:[UIColor ms_colorWithHexString:@"#224FA2"]];

}

- (void)setNavigationBar {

    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setTintColor:[UIColor whiteColor]];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [navigationBar setTitleTextAttributes:attributes];
    UIImage *image = [UIImage createImageWithColor:[UIColor ms_colorWithHexString:@"#224FA2"] withSize:CGSizeMake(self.view.bounds.size.width, 64)];
    [navigationBar setBackgroundImage:image forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.childViewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(popCurrentViewController)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popCurrentViewController {
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}

@end
