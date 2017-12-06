//
//  mode.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/10/27.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "Mode.h"

@implementation Mode
+(instancetype)modeWithDict:(NSDictionary *)dict{
    Mode *mode = [[self alloc]init];
    mode.name =  dict[@"name"];
    mode.icon    = dict[@"icon"];
    return mode;
}
@end
