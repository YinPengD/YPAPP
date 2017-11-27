//
//  dict_mode.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/10/27.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "dict_mode.h"
#import "Mode.h"
@implementation dict_mode
+(instancetype)modeGropWithDict:(NSDictionary *)dict{
    dict_mode *group = [[self alloc]init];
    group.header = dict[@"header"];
    //字典数组-》模型数组
    NSMutableArray *temp = [NSMutableArray array];
    //遍历cars字典，把字典转换为数组，字典必须为可变字典
    for (NSDictionary *Dict in  dict[@"list"]){
        Mode *mode = [Mode modeWithDict:Dict];
        [temp addObject:mode];
    }
    group.list = temp;
    return group;
}
@end
