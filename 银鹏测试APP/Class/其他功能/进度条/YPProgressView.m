//
//  YPProgressView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/2/3.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPProgressView.h"

@implementation YPProgressView
-(void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    //只有系统调用drawRect方法是，才会创建View相关联的上下文。所以不能使用[self drawRect:self.bouds];
    //重绘
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    //划弧
    // ------1.获取上下文
    CGContextRef ctx  = UIGraphicsGetCurrentContext();
    // ------2.描述路径
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat angle = self.progressValue * M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    // ------3.把路径添加到上下文中
    CGContextAddPath(ctx, path.CGPath);
    // ------4.把上下问的内容渲染到VIew的layer上
    CGContextStrokePath(ctx);
}


@end
