//
//  YPTGView.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/1.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YPtgMode;                       //用class引用一下，就防止重复导入
@interface YPTGView : UITableViewCell
@property(nonatomic,strong) YPtgMode *tg;
@end
