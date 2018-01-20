//
//  YPhitTestView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/28.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPhitTestView.h"
@interface YPhitTestView()
/** button */
@property(nonatomic,weak) IBOutlet UIButton  *btnP;
@end
@implementation YPhitTestView


/**
 当事件从上而下的寻找适合响应的View的时候会调用这个方法
 */
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    // 改变触摸点的坐标为bnt层级的坐标
    CGPoint btnPoint = [self convertPoint:point toView:self.btnP];
    // 当触摸点在按钮上的时候返回button用于响应
    if ([self.btnP pointInside:btnPoint withEvent:event]) {
        return self.btnP;
    }else{
        // 如果没有触摸则返回保持系统默认做法
        return [super hitTest:point withEvent:event];
    }
}
@end
