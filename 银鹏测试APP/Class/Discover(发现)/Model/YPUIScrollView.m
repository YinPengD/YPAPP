//
//  YPUIScrollView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/3/4.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPUIScrollView.h"
#import "YPPageView.h"
#import "Masonry.h"

@implementation YPUIScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//YPPageView *pageView =  [YPPageView pageView]; //注意：这样的写法存在有性能问题1.如果照片数量大了，加载的图片数量就过多了2.创建的image过多
//pageView.imageNames  = @[@"img_01",@"img_02",@"img_03",@"img_04"];
//[self.view addSubview:pageView];
//// 对pageView进行约束
//pageView.translatesAutoresizingMaskIntoConstraints  = NO;
//[pageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//    make.right.left.offset(0);
//    make.top.mas_equalTo(segmented.mas_bottom).offset(0);
//    make.bottom.mas_equalTo(segmented.mas_bottom).offset(134);
//}];
//// -----设置View背景默认为黑色
//self.view.backgroundColor = [UIColor whiteColor];
@end
