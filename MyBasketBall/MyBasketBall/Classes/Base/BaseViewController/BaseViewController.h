//
//  BaseViewController.h
//  YiJianBluetooth
//
//  Created by tyl on 16/8/5.
//  Copyright © 2016年 LEI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+StringColor.h"
#import "UILabel+Custom.h"
#import "JGProgressHUD.h"
#import "JGProgressHUDIndicatorView.h"
#import "JGProgressHUDPieIndicatorView.h"
#import "JGProgressHUDFadeZoomAnimation.h"
#import "MBProgressHUD.h"


@interface BaseViewController : UIViewController<JGProgressHUDDelegate,MBProgressHUDDelegate,UITableViewDelegate,UITableViewDataSource>{
    BOOL _blockUserInteraction;
}

@property (strong, nonatomic) MBProgressHUD *progressHUD;
@property (strong, nonatomic) UITableView *tableView;


- (void)backToSuper ;

- (void)setExtraCellLineHidden:(UITableView *)tableView;

- (void)setCustomRightBarButtonItem;
- (void)setCustomLeftBarButtonItem;

- (void)showSuccessHud:(NSUInteger)section ;

- (void)showErrorHud:(NSUInteger)section ;

- (void)showSimpleHud:(NSUInteger)section ;

- (void)showWithTextHud:(NSUInteger)section text:(NSString *)text done:(NSString *)text1;

- (void)showProgressHud:(NSUInteger)section text:(NSString *)text;

- (void)showZoomAnimationWithRing:(NSUInteger)section text:(NSString *)text;

-(void)showTextOnlyHud:(NSUInteger)section text:(NSString *)text;

- (void)dismissAfterDelay:(NSTimeInterval)delay animated:(BOOL)animated;

- (void)dismissAnimated:(BOOL)animated;




-(void)showToast:(NSString*) toast;

-(void)showHud:(NSString *)text onView:(UIView*)view;
-(void)showHud:(NSString *)text;
-(void)showHud;
-(void)hideHud;


@end
