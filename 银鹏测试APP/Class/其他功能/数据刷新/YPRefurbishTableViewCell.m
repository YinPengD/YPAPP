//
//  YPRefurbishTableViewCell.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/6.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPRefurbishTableViewCell.h"
#import "YPWine.h"
@interface YPRefurbishTableViewCell ()
@end

@implementation YPRefurbishTableViewCell
-(void)setWine:(YPWine *)wine{
    _wine = wine;
    self.textLabel.text = wine.name;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
}

@end
