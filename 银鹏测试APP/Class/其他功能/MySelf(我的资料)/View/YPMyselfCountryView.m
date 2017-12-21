//
//  YPMyselfCountryView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/21.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPMyselfCountryView.h"
#import "Countryitem.h"
@interface YPMyselfCountryView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
@implementation YPMyselfCountryView
// 设置自定义TextFieled的构造方法与创建，从xib创建
+(instancetype)YPMyselfCountryView{
    return [[[NSBundle mainBundle] loadNibNamed:@"CountryView" owner:nil options:nil]lastObject];
}
-(void)setItem:(Countryitem *)item{
    _item = item;
    self.nameLabel.text = item.name;
    self.iconImageView.image = [UIImage imageNamed:item.icon];
}
@end
