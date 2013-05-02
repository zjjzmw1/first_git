//
//  BaseViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-2.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "BaseViewController.h"
#import "CONSTS.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

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
    [self initNavigationbar:self centerName:@"特价预订" rightButtonName:nil leftImage:@"back.png" rightImage:nil];
    self.view.backgroundColor = BACKGROUND_CORLOR;
	
}

#pragma mark ====== 导航栏公用的方法 ======
-(void)initNavigationbar:(UIViewController *)tempViewController centerName:(NSString *)centerName rightButtonName:(NSString *)rightButtonName leftImage:(NSString *)leftImage rightImage:(NSString *)rightImage{
    //自定义返回按钮。
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tempButton setBackgroundImage:[UIImage imageNamed:leftImage] forState:UIControlStateNormal];
    tempButton.frame=CGRectMake(0, 0, 50, 30);
    [tempButton addTarget:tempViewController action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:tempButton];
    tempViewController.navigationItem.leftBarButtonItem=leftButton;
    [leftButton release];
    //右边按钮。
    UIButton *tempButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [tempButton1 setTitle:rightButtonName forState:UIControlStateNormal];
    [tempButton1 setBackgroundImage:[UIImage imageNamed:rightImage] forState:UIControlStateNormal];
    tempButton1.frame=CGRectMake(0, 0, 80, 30);
    [tempButton1 addTarget:tempViewController action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:tempButton1];
    tempViewController.navigationItem.rightBarButtonItem=rightButton;
    [rightButton release];
    //显示导航栏。
    [UIView animateWithDuration:0.4 animations:^{
        tempViewController.navigationController.navigationBarHidden = NO;
        tempViewController.navigationController.navigationBar.tintColor = [UIColor blackColor];
        tempViewController.navigationItem.title=centerName;
    }];
}
-(void)backAction:(id)sender{
    NSLog(@"父视图的返回方法。");
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightAction:(id)sender{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
