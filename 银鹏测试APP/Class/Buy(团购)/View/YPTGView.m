//
//  YPTGView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/1.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPTGView.h"
#import "YPtgMode.h"
#import "Masonry.h"
@interface YPTGView()
//** 图标 */
@property(nonatomic,weak) UIImageView  *iconImageView;
//** 标题 */
@property(nonatomic,weak)UILabel *titleLabel;
//** 价格 */
@property(nonatomic,weak)UILabel *priceLabel;
//** 购买数 */
@property(nonatomic,weak)UILabel *buyCountLabel;
@end
@implementation YPTGView

/**
 在这个方法内添加所有的子控件（一般在initWithFrame中添加子控件,但是tableviewcell调用的是initWithSyle方法
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    // ------自定义系统构造方法需要先调用父类
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        CGFloat space = 10;
        // ------设置图片
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView =iconImageView;
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(space);
            make.bottom.equalTo(self.contentView).offset(-space);
            make.width.equalTo(@80);
        }];
        // ------设置标题
        UILabel *titleLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel =titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.mas_top);
            make.left.equalTo(iconImageView.mas_right).offset(space);
            make.right.equalTo(self.contentView).offset(-space);
            make.height.equalTo(@20);
        }];
        // ------设值价格
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:priceLabel];
        self.priceLabel =priceLabel;
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel.mas_left);
            make.bottom.equalTo(iconImageView.mas_bottom);
            make.size.equalTo(self.constraints).sizeOffset(CGSizeMake(100, 15));
        }];
        // ------设置购买数
        UILabel *buyCountLabel = [[UILabel alloc]init];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        buyCountLabel.textColor = [UIColor lightGrayColor];
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel =buyCountLabel;
        [buyCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(iconImageView.mas_bottom);
            make.right.equalTo(titleLabel.mas_right);
            make.size.equalTo(self.constraints).sizeOffset(CGSizeMake(150, 14));
        }];
    }
    return self;
}


/**
 重写属性的set方法以设置子控件的数据
 @param tg 团购数据
 */
-(void)setTg:(YPtgMode *)tg{
    _tg = tg; //给成员变量赋值，后面可能会用到
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",tg.price];
    self.buyCountLabel.text  = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];
    
}
@end



