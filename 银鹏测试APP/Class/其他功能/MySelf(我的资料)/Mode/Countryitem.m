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
    [item setValuesForKeysWithDictionary:dict];
    return item;
}
@end
