//
//  YPtgMode.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/1.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YPtgMode : NSObject
//购买数
@property(nonatomic,copy) NSString    *buyCount;
//图标
@property(nonatomic,copy)NSString *icon;
//价格
@property(nonatomic,copy)NSString *price;
//标题
@property(nonatomic,copy)NSString *title;
//创建外界构造方法
+(instancetype)tgWithDict:(NSDictionary *)dict;
@end

