//
//  AppDelegate.h
//  booking
//
//  Created by zhangmingwei on 13-5-2.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDMenuController;
@class HomeViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) DDMenuController *menuController;
@property (strong, nonatomic) HomeViewController *homeVC;
@end
