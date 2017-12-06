//
//  mode.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/10/27.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mode : NSObject
//传入tablview名字
@property(strong,nonatomic) NSString *name;
//传入图片
@property(strong,nonatomic) NSString *icon;
+(instancetype)modeWithDict:(NSDictionary *)dict;
@end
