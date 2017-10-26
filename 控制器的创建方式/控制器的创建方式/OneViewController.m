//
//  OneViewController.m
//  控制器的创建方式
//
//  Created by lw on 15/6/16.
//  Copyright © 2015年 lw. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    UIWindow *mainWin = [UIApplication sharedApplication].keyWindow;
    //向窗口中添加按钮
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"曹颖😚" forState: UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 20);
    [mainWin addSubview:button];
    
    UISegmentedControl *sg = [[UISegmentedControl alloc]init];
    [sg insertSegmentWithTitle:@"全选" atIndex:0 animated:YES];
    [sg insertSegmentWithTitle:@"分组" atIndex:1 animated:YES];
    sg.frame = CGRectMake(0, 0, 150, 20);
    self.navigationItem.titleView = sg;
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    [mainWin addSubview:sg];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
//    self.view.backgroundColor = [UIColor grayColor];
//    //获取当前主窗口
//    UIWindow *mainWin = [UIApplication sharedApplication].keyWindow;
//    //向窗口中添加按钮
//    UIButton *button = [[UIButton alloc]init];
//    [button setTitle:@"曹颖😚" forState: UIControlStateNormal];
//    button.frame = CGRectMake(100, 100, 100, 20);
//    [mainWin addSubview:button];
//    [mainWin bringSubviewToFront:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
