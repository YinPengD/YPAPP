//
//  Countryitem.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/21.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Countryitem : NSObject
/*城市名字*/
@property (nonatomic,strong)   NSString *name;
/**城市图片*/
@property (nonatomic,strong)   NSString *icon;
//创建数据转化为模型的方法
+(instancetype)CountryItemDict:(NSDictionary *)dict;
@end
