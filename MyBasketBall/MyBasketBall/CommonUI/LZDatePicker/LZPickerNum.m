//
//  LZPickerNum.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LZPickerNum.h"

@interface LZPickerNum ()
{
    NSArray *_pickerArray;
}
@end

@implementation LZPickerNum

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* view_background=[[UIView alloc]initWithFrame:CGRectMake(0, SCR_H-200-36, SCR_W, 200+36)];
    view_background.backgroundColor=[UIColor whiteColor];
    
    
    _pickerArray = [NSArray arrayWithObjects:@"动物",@"植物",@"石头",@"天空", nil];

    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 36, SCR_W, 200)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
//    self.pickerView.frame = CGRectMake(0, 36, SCR_W, 200);
    

    self.toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 36)];
    self.toolbar.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UIBarButtonItem * cancelButton =[[UIBarButtonItem  alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    cancelButton.tintColor=[UIColor grayColor];
    UIBarButtonItem * button2 = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    doneButton.tintColor=hintColor;
    NSArray * buttonsArray = [NSArray arrayWithObjects:cancelButton,button2,doneButton,nil];
    [self.toolbar setItems:buttonsArray];
    [view_background addSubview:self.pickerView];
    [view_background addSubview:self.toolbar];
    [self.view addSubview:view_background];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;

}

+(instancetype) picker {
    return [[LZPickerNum alloc]init];
}

-(void)show
{
    UIViewController *viewController = ((AppDelegate *)[UIApplication sharedApplication].delegate).navController.visibleViewController;
    
    if ([[UIDevice currentDevice].systemVersion integerValue] >= 8)
    {
        //For iOS 8
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    else
    {
        //For iOS 7
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    [viewController  presentViewController:self animated:NO completion:^(void){
        
        
    }];
    
    
}
-(void)done{
    
    [self dismissViewControllerAnimated:NO completion:^(void){
        if(self.delegate){
//            [self.delegate onDatePickerChoose:self.pickerView.date];
        }
    }];
}
-(void)cancel{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1; // 返回1表明该控件只包含1列
}

//UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法返回teams.count，表明teams包含多少个元素，该控件就包含多少行
    return _pickerArray.count;
}


// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回teams中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用teams中的第几个元素
    
    return [_pickerArray objectAtIndex:row];
}

// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 使用一个UIAlertView来显示用户选中的列表项
//    UIAlertView* alert = [[UIAlertView alloc]
//                          initWithTitle:@"提示"
//                          message:[NSString stringWithFormat:@"你选中的球队是：%@"
//                                   , [ _teams objectAtIndex:row]]
//                          delegate:nil
//                          cancelButtonTitle:@"确定"
//                          otherButtonTitles:nil];
//    [alert show];
    NSLog(@"component:%ld",(long)component);
}


@end
