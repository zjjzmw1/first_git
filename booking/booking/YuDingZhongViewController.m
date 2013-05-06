//
//  YuDingZhongViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-3.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "YuDingZhongViewController.h"
#import "My97DatePicker.h"
#import "AttributedLabel.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
#import "YuDingOKViewController.h"  
@interface YuDingZhongViewController ()
@property (retain,nonatomic) My97DatePicker* piker;
@end

@implementation YuDingZhongViewController
@synthesize piker;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    CGRect frame = CGRectMake(118, 85, 122, 29);
    piker = [[My97DatePicker alloc] initWithFrame:frame];
    [self.view addSubview:piker];
    [piker release];
    
    self.timeArray = [NSMutableArray arrayWithObjects:@"08:00-11:00",@"12:00-15:00",@"17:00-21:00", nil];
    self.moneyArray = [NSMutableArray arrayWithObjects:@"168",@"200",@"260", nil];
    self.timeMoneyArray = [NSMutableArray arrayWithCapacity:10];
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 260-20, 320, 260+44)];
    self.backgroudForPickerView = vi;
    [vi release];
}
//确定预订按钮。
- (IBAction)queDingAction:(id)sender {
    if ([piker.text isEqualToString:@""]||piker.text==NULL) {
        UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:@"" message:@"请选择日期" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil]autorelease];
        [alert show];
        return;
    }
    NSLog(@"piker.text====+++======%@",piker.text);
    
    NSString *lastTime = [NSString stringWithFormat:@"%@月%@日",[piker.text substringWithRange:NSMakeRange(5,2)],[piker.text substringWithRange:NSMakeRange(8,2)]];
    NSLog(@"lastTime==%@",lastTime);
    int tempCount = [self.timeArray count];
    NSLog(@"tempCount==%d",tempCount);
    for (int i=0; i<tempCount; ++i) {
        NSString *tempString = [NSString stringWithFormat:@"%@%@    %@ 元",lastTime,[self.timeArray objectAtIndex:i],[self.moneyArray objectAtIndex:i]];
        NSLog(@"tempString===%@",tempString);
        [self.timeMoneyArray addObject:tempString];
    }
    NSLog(@"self.timeMoneyArray===%@",self.timeMoneyArray);
    [self pickerShow];
    
}

- (void)pickerShow {
    [self.view addSubview:self.backgroudForPickerView];
    if (pickerView == nil) {
        pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,260, 320, 216)];
        //    指定Delegate
        pickerView.delegate=self;
        //    显示选中框
        pickerView.showsSelectionIndicator=YES;
        [self.backgroudForPickerView addSubview:pickerView];
    }
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
	UIBarButtonItem *confirmBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(buttonPressed:)];
	UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
	UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(pickerHide)];
    [items addObject:cancelBtn];
    [items addObject:flexibleSpaceItem];
    [items addObject:confirmBtn];
    [cancelBtn release];
    [flexibleSpaceItem release];
    [confirmBtn release];
    
    if (self.toolBar==nil) {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, pickerView.frame.origin.y - 44, 320, 44)];
        [self.backgroudForPickerView addSubview:self.toolBar];
    }
    
    self.toolBar.barStyle = UIBarStyleBlackTranslucent;
    self.toolBar.items = items;
    [items release];
    items = nil;
    //[self.view addSubview:self.toolBar];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        pickerView.frame = CGRectMake(0, 44, 320, 216);
        self.toolBar.frame = CGRectMake(0, pickerView.frame.origin.y-44, 320, 44);
    }];
}

- (void)pickerHide
{
    [self.backgroudForPickerView removeFromSuperview];
    [UIView animateWithDuration:0.5 animations:^{
        pickerView.frame = CGRectMake(0, 260+44, 320, 216);
        self.toolBar.frame = CGRectMake(0, pickerView.frame.origin.y-44, 320, 44);
    }];
       
}
-(void) buttonPressed:(id)sender
{
    NSInteger row =[pickerView selectedRowInComponent:0];
    NSString *tempTitle = [self.timeMoneyArray objectAtIndex:row];
    [self pickerHide];
    YuDingOKViewController *yuDingOKVC = [[YuDingOKViewController alloc]initWithNibName:@"YuDingOKViewController" bundle:nil];
    [self.navigationController pushViewController:yuDingOKVC animated:YES];
    yuDingOKVC.timeLabel.text = tempTitle;
    yuDingOKVC.phoneTextField.text = self.phoneTextField.text;
    [yuDingOKVC release];
    
    
}
#pragma mark Picker Date Source Methods

//返回显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.timeMoneyArray count];
}

#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.timeMoneyArray objectAtIndex:row];
}


//实现第1方案：
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    AttributedLabel *showLabel = [[AttributedLabel alloc] initWithFrame:CGRectMake(30.0f,0.0f,280.0f,20.0f)];
    [showLabel setFont:[UIFont fontWithName:@"Arial" size:18] fromIndex:0 length:[showLabel.text length]];
    //以前不能改变字体大小，是因为没有AttributedLabel没有重写父类的方法。[super drawRect:rect];,但是重写了以后，就会重复了。
    showLabel.text = [self.timeMoneyArray objectAtIndex:row];
    showLabel.backgroundColor = [UIColor clearColor];
    [showLabel setColor:[UIColor redColor] fromIndex:17 length:7];
    showLabel.textAlignment = UITextAlignmentCenter;
    return [showLabel autorelease];
}

//更换手机号码的按钮。   

- (IBAction)changePhoneAction:(id)sender {
    [self.view setFrame:CGRectMake(0, -240, 320, 480)];
    self.phoneTextField.userInteractionEnabled = YES;
    [self.phoneTextField setText:@""];
    [self.phoneTextField becomeFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view setFrame:CGRectMake(0, 0, 320, 480)];
    self.phoneTextField.userInteractionEnabled = NO;
    [self.phoneTextField resignFirstResponder];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_phoneTextField release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setPhoneTextField:nil];
    [super viewDidUnload];
}
@end
