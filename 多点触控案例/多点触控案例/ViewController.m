//
//  ViewController.m
//  多点触控案例


#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)NSArray *image;

@end


@implementation ViewController

- (NSArray *)image{

    if (_image == nil) {
        _image = @[
                   [UIImage imageNamed:@"spark_magenta"],
                   [UIImage imageNamed:@"spark_green"]
                   ];
    }
    return _image;
}

- (void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

    int i=0;
    for (UITouch *touch in touches) {
        CGPoint loc = [touch locationInView:self.view];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:self.image[i]];
        imgView.center = loc;
        [self.view addSubview:imgView];
        
        [UIView animateWithDuration:1.5 animations:^{
            imgView.alpha = 0;
        }completion:^(BOOL finished) {
            [imgView removeFromSuperview];
        }];
    }
    i++;
}
- (void)touchesMoved:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{

    int i=0;
    for (UITouch *touch in touches) {
        CGPoint loc = [touch locationInView:self.view];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:self.image[i]];
        imgView.center = loc;
        [self.view addSubview:imgView];
        
        [UIView animateWithDuration:1.5 animations:^{
            imgView.alpha = 0;
        }completion:^(BOOL finished) {
            [imgView removeFromSuperview];
        }];
    }
    i++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
