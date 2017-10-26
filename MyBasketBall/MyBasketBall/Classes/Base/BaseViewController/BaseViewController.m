//
//  BaseViewController.m
//  YiJianBluetooth
//
//  Created by tyl on 16/8/5.
//  Copyright © 2016年 LEI. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Toast.h"
#import "MemberViewController.h"
#import "MessageViewController.h"

@interface BaseViewController (){
    JGProgressHUD *_HUD;
}

@end

@implementation BaseViewController

#pragma mark - lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
/*
//    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(LZCOLOR_MAIN);
    //选择自己喜欢的颜色
    UIColor * color = [UIColor whiteColor];
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    //大功告成
    self.navigationController.navigationBar.titleTextAttributes = dict;
    self.view.backgroundColor = [UIColor whiteColor];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
//        self.extendedLayoutIncludesOpaqueBars = NO;
//        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
*/
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent=NO;
//    self.tabBarController.tabBar.translucent=NO;
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.translucent=YES;
//    self.tabBarController.tabBar.translucent=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ui

- (void)setCustomLeftBarButtonItem {
    
//    MyCustomButton *button = [MyCustomButton buttonWithType:UIButtonTypeCustom];
//    [button setFrame:CGRectMake(0, 0, 60, 44)];
    UIImage *image = [UIImage imageNamed:@"back"];
//    [button setImage:image forState:UIControlStateNormal];
//    [button setMyButtonImageFrame:CGRectMake(0, 12, image.size.width-10, image.size.height-10)];
//    [button addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchDown];
//    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = item;

}

- (void)leftItemClick {

    MessageViewController *message = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:message animated:YES];
    
}

- (void)backToSuper {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setExtraCellLineHidden: (UITableView *)tableView{
    
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

- (void)setCustomRightBarButtonItem {
    
//    MyCustomButton *mapbutton = [MyCustomButton buttonWithType:UIButtonTypeCustom];
//    [mapbutton setFrame:CGRectMake(0, 0, 60, 44)];
//    [mapbutton setTitle:title forState:(UIControlStateNormal)];
//    mapbutton.titleLabel.font = [UIFont systemFontOfSize:text_size_small];
//    CGSize titleSize = [mapbutton.titleLabel sizeThatFits:CGSizeMake(60, 44)];
//    [mapbutton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    UIImage *image = [UIImage imageNamed:@"back"];
//    [mapbutton setImage:image forState:UIControlStateNormal];
//    [mapbutton setMyButtonContentFrame:CGRectMake(60 - image.size.width, 10, image.size.width, 25)];
//    [mapbutton addTarget:self action:@selector(rightItemClick) forControlEvents:UIControlEventTouchDown];
//    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:mapbutton];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)rightItemClick {

    MemberViewController *persion = [[MemberViewController alloc] init];
    [self.navigationController pushViewController:persion animated:YES];
    
}

#pragma mark - 提示信息处理

#pragma mark - JGProgressHUDDelegate

- (void)progressHUD:(JGProgressHUD *)progressHUD willPresentInView:(UIView *)view {
    NSLog(@"HUD %p will present in view: %p", progressHUD, view);
}

- (void)progressHUD:(JGProgressHUD *)progressHUD didPresentInView:(UIView *)view {
    NSLog(@"HUD %p did present in view: %p", progressHUD, view);
}

- (void)progressHUD:(JGProgressHUD *)progressHUD willDismissFromView:(UIView *)view {
    NSLog(@"HUD %p will dismiss from view: %p", progressHUD, view);
}

- (void)progressHUD:(JGProgressHUD *)progressHUD didDismissFromView:(UIView *)view {
    NSLog(@"HUD %p did dismiss from view: %p", progressHUD, view);
}

- (void)showSuccessHud:(NSUInteger)section {
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.userInteractionEnabled = _blockUserInteraction;
    _HUD.delegate = self;
    
    UIImageView *errorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jg_hud_success.png"]];
    _HUD.textLabel.text = @"Success!";
    JGProgressHUDIndicatorView *ind = [[JGProgressHUDIndicatorView alloc] initWithContentView:errorImageView];
    _HUD.progressIndicatorView = ind;
    
    _HUD.square = YES;
    
    [_HUD showInView:self.navigationController.view];
    
}

- (void)showErrorHud:(NSUInteger)section {
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.userInteractionEnabled = _blockUserInteraction;
    _HUD.delegate = self;
    
    UIImageView *errorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jg_hud_error.png"]];
    _HUD.textLabel.text = @"Error!";
    JGProgressHUDIndicatorView *ind = [[JGProgressHUDIndicatorView alloc] initWithContentView:errorImageView];
    _HUD.progressIndicatorView = ind;
    
    _HUD.square = YES;
    
    [_HUD showInView:self.navigationController.view];
    
}

- (void)showSimpleHud:(NSUInteger)section {
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.userInteractionEnabled = _blockUserInteraction;
    _HUD.delegate = self;
    
    [_HUD showInView:self.navigationController.view];
    
}

- (void)showWithTextHud:(NSUInteger)section text:(NSString *)text done:(NSString *)text1{
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.textLabel.text = text;
    _HUD.delegate = self;
    _HUD.userInteractionEnabled = _blockUserInteraction;
    [_HUD showInView:self.navigationController.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _HUD.useProgressIndicatorView = NO;
        
        _HUD.textLabel.font = [UIFont systemFontOfSize:30.0f];
        
        _HUD.textLabel.text = text1;
        
        _HUD.position = JGProgressHUDPositionBottomCenter;
    });
    
    _HUD.marginInsets = UIEdgeInsetsMake(0.0f, 0.0f, 10.0f, 0.0f);
    
}

- (void)showProgressHud:(NSUInteger)section text:(NSString *)text{
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.progressIndicatorView = [[JGProgressHUDPieIndicatorView alloc] initWithHUDStyle:_HUD.style];
    _HUD.delegate = self;
    _HUD.userInteractionEnabled = _blockUserInteraction;
    _HUD.textLabel.text = text;
    [_HUD showInView:self.navigationController.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:0.25 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:0.5 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:0.75 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:1.0 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD dismiss];
    });
}

- (void)showZoomAnimationWithRing:(NSUInteger)section text:(NSString *)text{
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.progressIndicatorView = [[JGProgressHUDPieIndicatorView alloc] initWithHUDStyle:_HUD.style];
    _HUD.userInteractionEnabled = _blockUserInteraction;
    JGProgressHUDFadeZoomAnimation *an = [JGProgressHUDFadeZoomAnimation animation];
    _HUD.animation = an;
    _HUD.delegate = self;
    _HUD.textLabel.text = text;
    [_HUD showInView:self.navigationController.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:0.25 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:0.5 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:0.75 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD setProgress:1.0 animated:YES];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_HUD dismiss];
    });
}

-(void)showTextOnlyHud:(NSUInteger)section text:(NSString *)text{
    _HUD = [[JGProgressHUD alloc] initWithStyle:(JGProgressHUDStyle)section];
    _HUD.useProgressIndicatorView = NO;
    _HUD.userInteractionEnabled = _blockUserInteraction;
    _HUD.textLabel.text = text;
    _HUD.delegate = self;
    _HUD.position = JGProgressHUDPositionCenter;
//    _HUD.marginInsets = (UIEdgeInsets) {
//        .top = 0.0f,
//        .bottom = 20.0f,
//        .left = 0.0f,
//        .right = 0.0f,
//    };
    
    [_HUD showInView:self.navigationController.view];
    
}

- (void)dismissAnimated:(BOOL)animated{
    [_HUD dismissAnimated:animated];
}

- (void)dismissAfterDelay:(NSTimeInterval)delay animated:(BOOL)animated{
    [_HUD dismissAfterDelay:delay animated:animated];
}

-(void)showHud:(NSString *)text onView:(UIView*)view{
    [self hideHud];
    self.progressHUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:self.progressHUD];
    
    self.progressHUD.delegate = self;
    self.progressHUD.labelText = text;
    self.progressHUD.removeFromSuperViewOnHide = YES;
    
    [self.progressHUD show:YES];
}

-(void)showHud:(NSString *)text{
//    UIViewController *viewController = ((AppDelegate *)[UIApplication sharedApplication].delegate).navController.visibleViewController;

    
    [self showHud:text onView:self.navigationController.view];
    //    self.progressHUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    //	[self.navigationController.view addSubview:self.progressHUD];
    //
    //	self.progressHUD.delegate = self;
    //	self.progressHUD.labelText = text;
    //    self.progressHUD.removeFromSuperViewOnHide = YES;
    //
    //    [self.progressHUD show:YES];
}
-(void)hideHud{
    if (![self.progressHUD isHidden]) {
        [self.progressHUD hide:YES];
    }
}
-(void)showHud{
    if ([self.progressHUD isHidden]) {
        [self.progressHUD show:YES];
    }
}

#pragma mark - toast

- (void)showToast:(NSString*) toast{
    
    [[UIApplication sharedApplication].keyWindow makeToast:toast duration:1.0 position:CSToastPositionCenter];
    
}

#pragma mark - tableview delegata and datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

@end
