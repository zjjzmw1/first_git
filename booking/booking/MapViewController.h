//
//  MapViewController.h
//  windows
//
//  Created by lijunlong on 13-3-18.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController

@property (assign ,nonatomic) CLLocationCoordinate2D to;

@property (retain,nonatomic) NSString *shopName;
@end
