//
//  YPStatusCell.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPStatusCell.h"
#import "YPStatus.h"

#define YPTextFont [UIFont systemFontOfSize:14]
#define YPNameFont [UIFont systemFontOfSize:17]
@interface YPStatusCell()
/** 图像 */
@property(nonatomic,weak) UIImageView  *iconImageView;
/** 昵称 */
@property(nonatomic,weak) UILabel  *nameLabel;
/** vip */
@property(nonatomic,weak) UIImageView  *VipImageView;
/** 正文 */
@property(nonatomic,weak) UILabel  *text_Label;
/** 配图 */
@property(nonatomic,weak) UIImageView  *pictureImageView;
@end
@implementation YPStatusCell

/**
 在initWithSyle中添加子控件
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //** 图像 */
        UIImageView  *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        //** 配图 */
        UIImageView  *pictureImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView  = pictureImageView;
        //** vip */
        UIImageView *vipImageView = [[UIImageView alloc]init];
        vipImageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImageView];
        self.VipImageView = vipImageView;
        //** 昵称 */
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = YPNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //** 正文 */
        UILabel  *text_Label = [[UILabel alloc]init];
            text_Label.numberOfLines = 0;
        text_Label.font = YPTextFont;
        [self.contentView addSubview:text_Label];
        self.text_Label = text_Label;
    }
    return self;
}

/**
 在layoutSubvews中对自控件进行布局
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconImageView.frame = self.status.iconframe;
    self.nameLabel.frame = self.status.nameframe;
    self.VipImageView.frame = self.status.vipframe;
    self.text_Label.frame = self.status.textframe;
    self.pictureImageView.frame = self.status.pictureframe;
}

/**
 设置cell的数据
 */
-(void)setStatus:(YPStatus *)status{
    _status = status;
    self.iconImageView.image = [UIImage imageNamed: status.icon];
    self.nameLabel.text = status.name;
    if(status.vip){
        self.VipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    }else{
        self.VipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    self.text_Label.text  = status.text;
    if (status.picture) {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed: status.picture];
    } else {
        self.pictureImageView.hidden = YES;
    }
}
@end
