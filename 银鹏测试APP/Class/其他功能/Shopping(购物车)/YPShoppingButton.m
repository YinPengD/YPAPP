//
//  YPShoppingButton.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/14.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPShoppingButton.h"

@implementation YPShoppingButton

-(void)awakeFromNib{
    // 设置边框宽度 = 1.0
    self.layer.borderWidth = 1.0;
    // 设置边框颜色
    self.layer.borderColor = [UIColor redColor].CGColor;
    // 设置圆角半径
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}
@end
