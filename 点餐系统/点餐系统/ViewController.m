//
//  ViewController.m
//  点餐系统
//
//  Created by lw on 15/6/16.
//  Copyright (c) 2015年 lw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)NSArray *foods;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return self.foods.count;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return [self.foods[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return self.foods[component][row];
}

- (NSArray *)foods{

    if (_foods == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil];
        _foods = [NSArray arrayWithContentsOfFile:path];
    }
    return _foods;

}

@end
