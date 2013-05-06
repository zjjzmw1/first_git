//
//  CONSTS.h
//  windows
//
//  Created by lijunlong on 13-3-8.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

//#ifndef windows_CONSTS_h
//#define windows_CONSTS_h
//
//
//
//#endif

#define BACKGROUND_CORLOR  [UIColor colorWithRed:48.0/255 green:53.0/255 blue:59.0/255 alpha:1]

#define BID [[NSUserDefaults standardUserDefaults] objectForKey:@"bid"]

#define SYSTEM_ERROR @"系统繁忙，请稍后再试！"


#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#define DATA_ENV [DataEnvironment sharedDataEnvironment]

#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]


////////////////////////////////////////////////////////////////////////////////
#pragma mark - common functions

#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }


////////////////////////////////////////////////////////////////////////////////
#pragma mark - degrees/radian functions

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#define radianToDegrees(radian) (radian*180.0)/(M_PI)

////////////////////////////////////////////////////////////////////////////////
#pragma mark - color functions

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]