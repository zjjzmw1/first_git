//
//  ShopDetailViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-3.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "YuDingZhongViewController.h"
@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

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
}

//定位的按钮。

- (IBAction)dingWeiAction:(id)sender {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(64.2323,32.3455) addressDictionary:nil] autorelease]];
    toLocation.name = self.title;
    [MKMapItem openMapsWithItems:[NSArray arrayWithObjects:currentLocation, toLocation, nil]
                   launchOptions:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeDriving, [NSNumber numberWithBool:YES], nil] forKeys:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeKey, MKLaunchOptionsShowsTrafficKey, nil]]];
    [toLocation release];

}

- (IBAction)yuDingAction:(id)sender {
    
    YuDingZhongViewController *yuDingZhongVC = [[YuDingZhongViewController alloc]initWithNibName:@"YuDingZhongViewController" bundle:nil];
    [self.navigationController pushViewController:yuDingZhongVC animated:YES];
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
