//
//  YPMySelfTextField.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/21.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPMySelfTextField.h"
#import "YPMyselfCountryView.h"
#import "Countryitem.h"
@interface YPMySelfTextField()<UIPickerViewDelegate,UIPickerViewDataSource>
/**国家模型数组*/
@property (nonatomic,strong)   NSMutableArray *countryArray;
@end
@implementation YPMySelfTextField

/**
 懒加载数据
 */
-(NSMutableArray *)countryArray{
    if (_countryArray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:nil];
        NSArray *countrydictArray =[NSMutableArray arrayWithContentsOfFile:path];
        _countryArray = [NSMutableArray array];
        for (NSDictionary *dict in countrydictArray) {
            Countryitem *item = [Countryitem CountryItemDict:dict];
            [_countryArray addObject:item];
        }
    }
    return _countryArray;
}
/**
 在这个方法中初始化自定义键盘这个方法在initWithCoder:方法后调用,一开始经过initWithCoder创建出来的控件是死的，然后通过awakeFromNib来唤醒
 */
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}

/**
 这个方法是当控件不是从xib、storyboard中创建时，就会调用这个方法
一般来说，若我们为了安全起见，初始化控件的代码我们写在一个方法里面，然后我们分别在initWithFrame和initWithCoder中都调用一下，这样就保证了无论你是通过什么方式创建的控件，代码 都能起到作用
 */
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化
        [self setUp];
    }
    return self;
}
-(void)setUp{
    UIPickerView *pick = [[UIPickerView alloc]init];
    // 设置代理与数据源
    pick.delegate = self;
    pick.dataSource = self;
    // 使得自定义一个键盘，弹出时是一个UIPickerVIew
    self.inputView = pick;
}
#pragma mark - *************** 实现UIPickerView的代理方法

/**
 设置有多少列
 */
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

/**
 总共有多少行
 */
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.countryArray.count;
}

/**
 设置每一行高度
 */
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 90;
}

/**
 设置每一行的自定义的控件
 */
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    // 创建一个View
    YPMyselfCountryView *flagView = [YPMyselfCountryView YPMyselfCountryView];
    // 去除当前行的模型
    Countryitem *item1 = self.countryArray[row];
    // 把模型赋值给Countryitem的item属性，就会调用FlagItem的set方法
    flagView.item = item1;
    return flagView;
}
@end
