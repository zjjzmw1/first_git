//
//  ShopListViewController.m
//  booking
//
//  Created by zhangmingwei on 13-5-3.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "ShopListViewController.h"
#import "MCSegmentedControl.h"
#import <QuartzCore/QuartzCore.h>
#import "ShopListCell.h"
#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "ShopDetailViewController.h"
@interface ShopListViewController ()

@end

@implementation ShopListViewController
@synthesize myTableView,dataArray;
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
    
    
    
    [ViewControllerFactory creatMySegment:self contentArray:[NSArray arrayWithObjects:
                                             @"今天",
                                             @"明天",
                                             @"后天",@"一周内",@"一周后",
                                             nil] frame:CGRectMake(10.0f, 8.0f, 300.0f, 44.0f) selectedIndex:0 selectedBgColor:[UIColor redColor] unSelectedBgColor:[UIColor lightGrayColor] selectedTextColor:[UIColor whiteColor] unSelectedTextColor:[UIColor whiteColor]];
    
  
    
    if (isIPhone5) {
        myTableView = [[UITableView alloc]initWithFrame:CGRectMake(4, 110, 312, 548-76-83) style:UITableViewStylePlain];
    }else{
        myTableView = [[UITableView alloc]initWithFrame:CGRectMake(4, 60, 312, 460-76-83) style:UITableViewStylePlain];
    }
    
    self.myTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;//cell上的线隐藏。
    self.myTableView.dataSource=self;
    self.myTableView.delegate=self;
    [self.view addSubview: self.myTableView];//这里必须用等于，因为在MyLikeCell中必须找准要的那个tableview。
    //下面必须是浮点型的。
    self.myTableView.backgroundColor = BACKGROUND_CORLOR;
    self.myTableView.layer.masksToBounds = YES;
    self.myTableView.layer.cornerRadius = 3;
    [myTableView release];

    
    
    
}
- (void)segmentedControlDidChange:(MCSegmentedControl *)sender
{
	NSLog(@"%d", [sender selectedSegmentIndex]);
}
#pragma mark ====== 控制区域的个数 ======
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark ====== 控制每个区域的行数 ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
#pragma mark ====== 行高度 ======
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}
#pragma mark ====== 区域头的视图 ======
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //这里是表头的视图。应该是imageview 也不用放label ,直接图片就行。
    UIImageView *sectionImageV = [[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 320, 44)]autorelease];
    sectionImageV.image = [UIImage imageNamed:@"xiaoFei_section"];
    return sectionImageV;
}
#pragma mark ====== 区域头的高度 ======
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
#pragma mark ====== 显示表格每行的内容 ======
- (ShopListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ShopListCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ShopListCell" owner:self options:nil] objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //暂时先写死。
    ShopDetailViewController *shopDetailVC = [[ShopDetailViewController alloc]initWithNibName:@"ShopDetailViewController" bundle:nil];
    [self.navigationController pushViewController:shopDetailVC animated:YES];
    shopDetailVC.title = @"东风造型";
    
    
}
//点击排序按钮触发的方法。
- (IBAction)paixuAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"价格排序" destructiveButtonTitle:@"时间排序" otherButtonTitles:nil, nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
    [actionSheet release];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex=== %d",buttonIndex);
}
//定位按钮。
- (IBAction)dingWeiButton:(id)sender {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(switchFocusImageItems) object:nil];
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(64.2323,32.3455) addressDictionary:nil] autorelease]];
    toLocation.name = self.title;
    [MKMapItem openMapsWithItems:[NSArray arrayWithObjects:currentLocation, toLocation, nil]
                   launchOptions:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeDriving, [NSNumber numberWithBool:YES], nil] forKeys:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeKey, MKLaunchOptionsShowsTrafficKey, nil]]];
    [toLocation release];

}
//历史记录按钮。
- (IBAction)liShiAction:(id)sender {
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
