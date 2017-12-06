//
//  YPtgMode.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/1.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPtgMode.h"

@implementation YPtgMode

// ------实现外界构造方法
+(instancetype)tgWithDict:(NSDictionary *)dict{
    YPtgMode *mode =[[self alloc]init];
    [mode setValuesForKeysWithDictionary:dict];  //因为数据整齐可以用键值对进行赋值
    return mode;
}

@end
