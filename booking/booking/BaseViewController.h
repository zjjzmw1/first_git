//
//  BaseViewController.h
//  booking
//
//  Created by zhangmingwei on 13-5-2.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


-(void)initNavigationbar:(UIViewController *)tempViewController centerName:(NSString *)centerName rightButtonName:(NSString *)rightButtonName leftImage:(NSString *)leftImage rightImage:(NSString *)rightImage;

@end
