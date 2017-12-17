//
//  YPShoppingCell.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/13.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPShoppingCell.h"
#import "YPShoppingButton.h"
#import "YPWine.h"
@interface YPShoppingCell()
@property (weak, nonatomic) IBOutlet UIImageView *wineImageView;
@property (weak, nonatomic) IBOutlet UILabel *wineTitle;
@property (weak, nonatomic) IBOutlet UILabel *wineMoney;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet YPShoppingButton *minusButton;


@end
@implementation YPShoppingCell
-(void)setWines:(YPWine *)wines{
    _wines = wines;
    self.wineImageView.image = [UIImage imageNamed:wines.image];
    self.wineTitle.text = wines.name;
    self.wineMoney.text = [NSString stringWithFormat:@"¥%@",wines.money];
    // 根据count的数据决定minus按钮是否能够被点击
    self.minusButton.enabled = (wines.count >0);
}
- (IBAction)plusButtonClick {
    // 1.修改模型
    self.wines.count ++;
    // 2.修改视图
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wines.count];
    // 3.减号按钮能够被点击
    self.minusButton.enabled = YES;
    //4.发布通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClickNotification" object:self];
    
}
- (IBAction)minusButtonClick {
    // 1.修改模型
    self.wines.count --;
    // 2.修改视图
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wines.count];
    // 3.减号按钮不能够被点击
    if (self.wines.count == 0) {
    self.minusButton.enabled = NO;
    }
    // 4.发布通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClickNotification" object:self];
}
@end
