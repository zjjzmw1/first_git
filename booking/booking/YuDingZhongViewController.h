//
//  YuDingZhongViewController.h
//  booking
//
//  Created by zhangmingwei on 13-5-3.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "BaseViewController.h"
@interface YuDingZhongViewController : BaseViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *pickerView;
    int queDingFlag;
}
@property (nonatomic,retain) UIView *backgroudForPickerView;
@property (nonatomic, retain) UIToolbar *toolBar;

@property (nonatomic,retain) NSMutableArray *timeMoneyArray;
@property (nonatomic,retain) NSMutableArray *timeArray;
@property (nonatomic,retain) NSMutableArray *moneyArray;


@property (retain, nonatomic) IBOutlet UITextField *phoneTextField;


@end
