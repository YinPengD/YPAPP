//
//  YPDownload.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/3/6.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPDownload.h"

@implementation YPDownload
+(instancetype)appWithDict:(NSDictionary *)dict
{
    YPDownload *appM = [[YPDownload alloc]init];
    //kvc
    [appM setValuesForKeysWithDictionary:dict];
    return appM;
}
@end
