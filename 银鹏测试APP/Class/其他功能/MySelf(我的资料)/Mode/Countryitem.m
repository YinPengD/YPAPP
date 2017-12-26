//
//  Countryitem.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/21.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "Countryitem.h"
@implementation Countryitem
+(instancetype)CountryItemDict:(NSDictionary *)dict{
    Countryitem *item = [[self alloc]init];
    // 通过KVC给创建的模型赋值
    //[item setValuesForKeysWithDictionary:dict];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [item setValue:obj forKey:key];
    }];
//setValue:forKeyPath:的底层实现:
//    1.它会调 这个属性的set 法.
    //2.如果没有set 法,它会去判断有没有跟key值同名的成员属性.如果有,就直接赋 值,icon = obj.
    //3.如果没有,那么它还会去判断有没有跟key值名相同带有下划线的成员属性,如果有,就直 接赋值,_icon = obj.
//    4.如果都没有, 就直接报错.找不到对应的成员属性.
//    利 KVC会调 调 属性的set 法. 当给icon属性赋值时,把传进来的字符串当作图 的名称,创建 个图 ,再给图 进 赋 值.
//    这 的参数,类型是可以改的
    return item;
}
- (void)setIcon:(NSString *)icon{
    UIImage *image = [UIImage imageNamed:icon];
    _icon = image;
}
@end
