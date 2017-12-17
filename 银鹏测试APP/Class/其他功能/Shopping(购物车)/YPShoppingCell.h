//
//  YPShoppingCell.h
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/13.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YPWine;
@interface YPShoppingCell : UITableViewCell
/**酒的模型*/
@property (nonatomic,strong)   YPWine *wines;
@end
