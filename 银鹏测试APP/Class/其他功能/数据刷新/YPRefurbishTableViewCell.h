//
//  YPRefurbishTableViewCell.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/6.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPWine;           //当.h 文件都需要引用是用class
@interface YPRefurbishTableViewCell : UITableViewCell
/**模型属性*/
@property (nonatomic,strong)   YPWine *wine;
@end
