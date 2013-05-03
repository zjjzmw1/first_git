//
//  HomeViewController.h
//  booking
//
//  Created by zhangmingwei on 13-5-2.
//  Copyright (c) 2013年 zhangmingwei. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *pickerView;
}
@property (retain,nonatomic) UIButton *middleButton;
@property (nonatomic,retain) UIView *backgroudForPickerView;
@property (nonatomic, retain) UIToolbar *toolBar;
@property(retain,nonatomic) NSArray *cityArray;
@property(retain,nonatomic) NSArray *typeArray;     //服务类型的数组。
@end
