//
//  YPTransformView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/27.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPTransformView.h"
@interface YPTransformView()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end
@implementation YPTransformView

/**
 向上平移
 */
- (IBAction)moveUP:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        //使用Make,他是相对于原始的位置做的形变
        //self.imageV.transform = CGAffineTransfromMakeTranslation(0,-100);
        //相对于上一次做形变
        self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, 0, -100);
    }];
}

/**
 旋转
 */
- (IBAction)rotation:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, M_PI_4);
    }];
}

/**
 缩放
 */
- (IBAction)scale:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.imageV.transform = CGAffineTransformScale(self.imageV.transform,0.5,0.5);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
