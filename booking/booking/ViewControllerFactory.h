//
//  ViewControllerFactory.h
//  windows
//
//  Created by lijunlong on 13-3-1.
//  Copyright (c) 2013年 lijunlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewControllerFactory : NSObject
//适配iphone5公用的方法。
+(id)createViewControllerByControllerName:(NSString*) controllerName;
+(id)createViewByViewName:(NSString*) viewName owner:(id) fileOwner options:(NSDictionary *)option;
//拨打电话.
+(void)telViewController:(id)viewController telNum:(NSString *)telNum;
//拨打电话时候用的单例。
+ (ViewControllerFactory *)sharedManager;

+(BOOL)saveFileToLoc:(NSString *) fileName theFile:(id) file;
+(BOOL) getFileFromLoc:(NSString*)filePath into:(id)dic;
+ (NSString *)md5Digest:(NSString *)str;
//把时间戳转换为时间。
+(NSString *)fromTimeChuoTotime:(NSString *)timeChuo;

//下面两个是提示是否登陆，和登陆信息已经过期了的提示框。
+(void)showLoginAlert:(id)ViewController;
+(void)showOutOfDateAlert:(id)ViewController;
+(void)showMessageAlert:(NSString *)message;
//下面是请求失败的方法。
+(void)requestFailCode:(NSString *)code ViewController:(id)ViewController resDict:(NSDictionary *)resDict;
@end
