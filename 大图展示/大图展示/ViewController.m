//
//  ViewController.m
//  大图展示
//
//  Created by lw on 15/6/20.
//  Copyright © 2015年 lw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController
- (IBAction)move:(id)sender {

    CGPoint point = self.scrollView.contentOffset;
    point.x += 20;
    point.y += 20;
    
    
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = point;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.contentSize = self.imageView.frame.size;
   // self.scrollView.contentOffset = CGPointMake(100, 100);
    self.scrollView.contentInset = UIEdgeInsetsMake(20, 40, 60, 80);
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.minimumZoomScale = 0.5;
    
}
-(nullable UIView *)viewForZoomingInScrollView:(nonnull UIScrollView *)scrollView{

    NSLog(@"放大");
    return  self.imageView;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    NSLog(@"%f",scrollView.frame.origin.x);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
