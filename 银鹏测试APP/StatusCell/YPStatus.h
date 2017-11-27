//
//  YPStatus.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <UIKit/UIKit.h>   //原来为Foundation/Foundation.h ，但是CGFloat 是属于UIKIt库的

@interface YPStatus : NSObject
// ------创建模型需要取得数据
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign,getter=isVip) BOOL vip;
@property(nonatomic,copy)NSString *picture;
// ------返回cell的高度
@property(nonatomic,assign) CGFloat cellHeight;
// ------返回各控件的frame
@property(nonatomic,assign) CGRect iconframe;
@property(nonatomic,assign) CGRect nameframe;
@property(nonatomic,assign) CGRect textframe;
@property(nonatomic,assign) CGRect vipframe;
@property(nonatomic,assign) CGRect pictureframe;
@end
