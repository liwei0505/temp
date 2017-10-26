//
//  ViewController.m
//  触摸事件
//
//  Created by lw on 15/6/24.
//  Copyright © 2015年 lw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (nonatomic,strong) NSArray *images;
@end

//手指按下

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

//    NSLog(@"开始");
    int i = 0;
    for (UITouch *touch in touches) {
        CGPoint loc = [touch locationInView:self.view];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.images[i]]];
        [self.view addSubview:imgView];
        imgView.center = loc;
        i++;
        [UIView animateWithDuration:1.5 animations:^{
            imgView.alpha = 0;
        } completion:^(BOOL finished) {
            [imgView removeFromSuperview];
        }];

    }
    
}

-(void)touchesMoved:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

//        NSLog(@"移动");
    int i = 0;
    for (UITouch *touch in touches) {
        CGPoint loc = [touch locationInView:self.view];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.images[i]]];
        [self.view addSubview:imgView];
        imgView.center = loc;
        i++;
        [UIView animateWithDuration:1.5 animations:^{
            imgView.alpha = 0;
        } completion:^(BOOL finished) {
            [imgView removeFromSuperview];
        }];
    }

   
}
-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

        NSLog(@"结束");
}

-(NSArray *)images{

    if (_images == nil) {
        _images = @[@"spark_blue",@"spark_magenta"];
    }
    return _images;
}

//单点触摸案例
//-(void)singleTouch{
//    UITouch *touch = touches.anyObject;
//    CGPoint pre = [touch locationInView:self.view];
//    CGPoint loc = [touch previousLocationInView:self.view];
//    CGFloat x = loc.x - pre.x;
//    CGFloat y = loc.y - pre.y;
//    self.greenView.transform = CGAffineTransformTranslate(self.greenView.transform, x, 0);
//}
@end
