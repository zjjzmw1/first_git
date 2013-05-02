//
//  HomeViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-2.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "HomeViewController.h"

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
//    [super initNavigationbar:self centerName:@"特价预订北京" rightButtonName:@"back.png" leftImage:@"back.png" rightImage:@"back.png"];
    // Do any additional setup after loading the view from its nib.
}
-(void)backAction:(id)sender{
    NSLog(@"子视图的返回方法。");
//    self.title = @"33";
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
