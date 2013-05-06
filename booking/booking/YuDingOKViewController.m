//
//  YuDingOKViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-3.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "YuDingOKViewController.h"

@interface YuDingOKViewController ()

@end

@implementation YuDingOKViewController

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
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)changeTimeAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)changePhoneAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameLabel release];
    [_typeButton release];
    [_timeLabel release];
    [_phoneTextField release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNameLabel:nil];
    [self setTypeButton:nil];
    [self setTimeLabel:nil];
    [self setPhoneTextField:nil];
    [super viewDidUnload];
}
@end
