//
//  YPDownload.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/3/6.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPDownload : NSObject
/**名称*/
@property (nonatomic,strong)   NSString *name;
/**Url地址*/
@property (nonatomic,strong)   NSString *icon;
/**下载量*/
@property (nonatomic,strong)   NSString *download;

+(instancetype)appWithDict:(NSDictionary *)dict;
@end
