//
//  dict_mode.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/10/27.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dict_mode : NSObject
//头部信息
@property(strong,nonatomic) NSString *header;
//每列
@property(strong,nonatomic) NSArray *list;
+(instancetype)modeGropWithDict:(NSDictionary *)dict;
@end
