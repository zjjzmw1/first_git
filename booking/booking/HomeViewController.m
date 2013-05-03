//
//  HomeViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-2.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "HomeViewController.h"
#import "ShopListViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

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
    self.cityArray = [NSArray arrayWithObjects:@"北京",@"上海",@"广州",nil];
    self.typeArray = [NSArray arrayWithObjects:@"美发烫染",@"足疗按摩",@"保洁",@"运动健身",@"美甲",nil];
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 260-20, 320, 260+44)];
    self.backgroudForPickerView = vi;
    [vi release];
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.middleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.middleButton.frame = CGRectMake(50, 0, 100, 44);
    [self.middleButton setTitle:@"特价预订（北京）" forState:UIControlStateNormal];
    [self.middleButton addTarget:self action:@selector(pickerShow) forControlEvents:UIControlEventTouchUpInside];
    self.middleButton.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = self.middleButton;
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
    NSString *tempTitle = [NSString stringWithFormat:@"特价预订（%@）", [self.cityArray objectAtIndex:row]];
    [self.middleButton setTitle:tempTitle forState:UIControlStateNormal];
    [self pickerHide];
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
    return [self.cityArray count];
}

#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.cityArray objectAtIndex:row]; 
}


#pragma mark === 点击按钮触发的方法=======

- (IBAction)myButtonAction:(id)sender {
    ShopListViewController *shopListVC = [[ShopListViewController alloc]initWithNibName:@"ShopListViewController" bundle:nil];
    UIButton *tempButton = (UIButton *)sender;
    [self.navigationController pushViewController:shopListVC animated:YES];
    shopListVC.title = [self.typeArray objectAtIndex:tempButton.tag-1];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
