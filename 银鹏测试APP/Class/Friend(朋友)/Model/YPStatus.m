//
//  YPStatus.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPStatus.h"

@implementation YPStatus
-(CGFloat)cellHeight{
    if (_cellHeight == 0) {
        CGFloat Space = 10;
        //头像
        CGFloat iconx = Space;
        CGFloat icony = Space;
        CGFloat iconw = 30;
        CGFloat iconh = 30;
        self.iconframe = CGRectMake(iconx, icony, iconw, iconh);
        //昵称
        CGFloat namex = CGRectGetMaxX(self.iconframe) + Space;
        CGFloat namey = Space;
        NSDictionary *nameAtt = @{NSFontAttributeName: [UIFont systemFontOfSize:17]}; //函数：NSFontAttributeName --> 作用：改变一段文字的大小
        CGSize nameSize = [self.name sizeWithAttributes:nameAtt];        //函数：sizeWithAttriiute --> 作用：算出数组中的尺寸属性
        
        CGFloat namew =nameSize.width;
        CGFloat nameh = nameSize.height;
        self.nameframe = CGRectMake(namex, namey, namew, nameh);
        //vip
        if(self.vip){
            CGFloat vipx = CGRectGetMaxX(self.nameframe) + Space;
            CGFloat vipw =14;
            CGFloat viph = 14;
            CGFloat vipy = namey + (nameh - viph)*0.5;
            self.vipframe = CGRectMake(vipx, vipy, vipw, viph);
        }
        //正文
        CGFloat textx = Space;
        CGFloat texty = CGRectGetMaxX(self.iconframe) + Space;
        CGFloat textw = [UIScreen mainScreen].bounds.size.width - 2 * Space;
        CGSize textSize = CGSizeMake(textw, MAXFLOAT);
        NSDictionary *textAtt = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
        CGFloat texth   = [self.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes: textAtt context:nil].size.height;
        self.textframe = CGRectMake(textx, texty,textw, texth);
        //配图
        if(self.picture){
            CGFloat picturex  = Space;
            CGFloat picturey = CGRectGetMaxY(self.textframe) + Space;
            CGFloat picturew = 100;
            CGFloat pictureh = 100;
            self.pictureframe = CGRectMake(picturex, picturey, picturew, pictureh);
            _cellHeight  = CGRectGetMaxY(self.pictureframe) + Space;
        }else{
        _cellHeight = CGRectGetMaxY(self.textframe) + Space;
       }
    }
        return _cellHeight;
}
@end
    
