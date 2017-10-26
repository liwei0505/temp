//
//  LZDateTimePicker.m
//  basketBallTemplate
//
//  Created by lizhe on 16/9/25.
//  Copyright © 2016年 lizhe. All rights reserved.
//

#import "LZDateTimePicker.h"

@interface LZDateTimePicker ()
{
    
    NSMutableArray *yearArray;
    NSArray *monthArray;
    NSMutableArray *DaysArray;
    NSArray *amPmArray;
    NSArray *hoursArray;
    NSMutableArray *minutesArray;
    
    NSString *currentMonthString;
    
    int selectedYearRow;
    int selectedMonthRow;
    int selectedDayRow;
    
    BOOL firstTimeLoad;
    
}
@end

@implementation LZDateTimePicker

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView* view_background=[[UIView alloc]initWithFrame:CGRectMake(0, SCR_H-200-36, SCR_W, 200+36)];
    view_background.backgroundColor=[UIColor whiteColor];
    
    
    
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 36, SCR_W, 200)] ;
    self.datePicker.tag = 100;
    [self.datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    self.datePicker.datePickerMode=UIDatePickerModeDateAndTime;
    if(self.currentDate){
        self.datePicker.date=self.currentDate;
    }
    self.toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 36)];
    self.toolbar.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UIBarButtonItem * cancelButton =[[UIBarButtonItem  alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    cancelButton.tintColor=[UIColor grayColor];
    UIBarButtonItem * button2 = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
    doneButton.tintColor=hintColor;
    NSArray * buttonsArray = [NSArray arrayWithObjects:cancelButton,button2,doneButton,nil];
    [self.toolbar setItems:buttonsArray];
    [view_background addSubview:self.datePicker];
    [view_background addSubview:self.toolbar];
    [self.view addSubview:view_background];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
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
            [self.delegate onDatePickerChoose:self.datePicker.date];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
