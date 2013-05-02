//
//  ViewControllerFactory.m
//  windows
//
//  Created by lijunlong on 13-3-1.
//  Copyright (c) 2013年 lijunlong. All rights reserved.
//

#import "ViewControllerFactory.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ViewControllerFactory
#pragma mark ====== 适配iphone5公用的方法 ======
+(id)createViewControllerByControllerName:(NSString*) controllerName {
    if (controllerName == nil || [controllerName isEqualToString:@""]) {
        return nil;
    }
    NSString *controllerXibName = nil;
    if (isIPhone5) {
        controllerXibName = [NSString stringWithFormat:@"%@_iphone5",controllerName];
    }else {
        controllerXibName = controllerName;
    }
    Class class = NSClassFromString(controllerName);
   return  [[[class alloc] initWithNibName:controllerXibName bundle:nil] autorelease];
}

+(id)createViewByViewName:(NSString*) viewName owner:(id) fileOwner options:(NSDictionary *)option {
    if (viewName == nil || [viewName isEqualToString:@""]) {
        return nil;
    }
    NSString *viewXibName = nil;
    if (isIPhone5) {
        viewXibName = [NSString stringWithFormat:@"%@_iphone5",viewName];
    }else {
        viewXibName = viewName;
    }
    
    return  [[[NSBundle mainBundle] loadNibNamed:viewXibName owner:fileOwner options:option] objectAtIndex:0];
}

#pragma mark ====== 拨打电话的方法 ======
+(void)telViewController:(id)viewController telNum:(NSString *)telNum{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:(id)[ViewControllerFactory sharedManager] cancelButtonTitle:@"取消" destructiveButtonTitle:telNum otherButtonTitles:nil, nil];
    UIViewController *tempViewController = (id)viewController;
    [actionSheet showInView:tempViewController.view];
    [actionSheet release];
}
#pragma mark ====== 是否取消或者继续拨打电话 ======
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *telString = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    //NSLog(@"buttonTitle===%@",[actionSheet buttonTitleAtIndex:buttonIndex]);
    //NSLog(@"%d",buttonIndex);
    if (buttonIndex==0) {
        NSString *deviceType = [UIDevice currentDevice].model;
        if([deviceType  isEqualToString:@"iPod touch"]||[deviceType  isEqualToString:@"iPad"]||[deviceType  isEqualToString:@"iPhone Simulator"]){
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"您的设备不能打电话" delegate:nil cancelButtonTitle:@"好的,知道了" otherButtonTitles:nil,nil];
            [alert show];
            [alert release];
            return;
        }
        UIWebView*callWebview =[[UIWebView alloc] init];
        NSURL *telURL =[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",telString]];// 貌似tel:// 或者 tel: 都行
        [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
        [[actionSheet superview] addSubview:callWebview];
        [callWebview release];
    }
}

#pragma mark ====== 弹出是否登陆的的提示框 ======
+(void)showLoginAlert:(id)ViewController{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"先登录" message:@"您需要先登录才能完成操作" delegate:ViewController cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
    [alert show];
    [alert autorelease];
}
#pragma mark ====== 弹出ptstr过期的提示框 ======
+(void)showOutOfDateAlert:(id)ViewController{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的登陆信息已过期" message:@"是否从新登陆" delegate:ViewController cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
    [alert show];
    [alert autorelease];
}

+(void)showMessageAlert:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [alert autorelease];
}

#pragma mark ====== 请求失败的情况，比如：返回10002等等 ======
+(void)requestFailCode:(NSString *)code ViewController:(id)ViewController resDict:(NSDictionary *)resDict{
    if ([code isEqualToString: @"10002"]){
        [ViewControllerFactory showOutOfDateAlert:ViewController];
    }else{
        NSLog(@"错误信息==%@",[resDict objectForKey:@"msg"]);
    }
    
}

+(BOOL)saveFileToLoc:(NSString *) fileName theFile:(id) file{
    NSLog(@"%@",file);
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *urlString2 = @"http://i.meijika.com/business/home.txt";
    NSString *CachePath = [fileName stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    NSString *filename=[Path stringByAppendingPathComponent:CachePath];
    NSLog(@"%@",fileName);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filename]) {
        if (! [fileManager createFileAtPath:filename contents:nil attributes:nil]) {
            NSLog(@"createFile error occurred");
        }
    }
   return  [file writeToFile:filename atomically:YES];
}

+(BOOL) getFileFromLoc:(NSString*)filePath into:(id)file {
    NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *urlString2 = @"http://i.meijika.com/business/home.txt";
    NSString *CachePath = [filePath stringByReplacingOccurrencesOfString: @"/" withString: @"_"];
    NSString *filename=[Path stringByAppendingPathComponent:CachePath];
    if ([file isKindOfClass:[NSDictionary class]]) {
         [file setDictionary: [NSDictionary dictionaryWithContentsOfFile:filename]];
    }else if ([file isKindOfClass:[NSArray class]]) {
         [file addObjectsFromArray: [NSArray arrayWithContentsOfFile:filename]];
    }
   
    //NSLog(@"%@",file);
    return YES;
}

+ (NSString *)md5Digest:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0], result[1], result[2], result[3], result[4], result[5],result[6], result[7],result[8], result[9], result[10], result[11], result[12],
             result[13], result[14],result[15]] uppercaseString];
}

static ViewControllerFactory *classA = nil;//静态的该类的实例
+ (ViewControllerFactory *)sharedManager
{
@synchronized(self) {
    if (!classA) {
        classA = [[super allocWithZone:NULL]init];
    }
    return classA;
}
}
+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
}
- (id)copyWithZone:(NSZone *)zone {
    return self;
}
- (id)retain {
    return self;
}
//- (NSUIntger)retainCount {
//    return NSUIntgerMax;
//}
- (oneway void)release {
}
- (id)autorelease {
    return self;
}
-(void)dealloc{
}
#pragma mark ========从时间戳转换为时间==========
+(NSString *)fromTimeChuoTotime:(NSString *)timeChuo{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *nowDate = [NSDate date];
    NSDate *yesterDate = [NSDate dateWithTimeInterval:-24*3600 sinceDate:nowDate];
    NSDate *myDate = [NSDate dateWithTimeIntervalSince1970:[timeChuo doubleValue]];
    
    NSString *nowDateString = [formatter stringFromDate:nowDate];
    NSString *yesterDateString = [formatter stringFromDate:yesterDate];
    NSString *myDateString = [formatter stringFromDate:myDate];
    
    if ([myDateString isEqualToString:nowDateString]) {
        return @"今天";
    }else if([myDateString isEqualToString:yesterDateString]){
        return @"昨天";
    }else{
        return myDateString;
    }

}

@end
