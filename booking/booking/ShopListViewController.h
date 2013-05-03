//
//  ShopListViewController.h
//  booking
//
//  Created by zhangmingwei on 13-5-3.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "BaseViewController.h"

@interface ShopListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>


@property (retain,nonatomic) NSMutableArray *dataArray;             //商家列表的数据。
@property (retain,nonatomic) UITableView *myTableView;              //自定义表格。
@end
