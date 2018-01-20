//
//  YPhitButton.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/1/19.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPhitButton.h"

@implementation YPhitButton

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.popBtn) {
        // 把触摸点放在按钮的坐标系中
        CGPoint popBtnP = [self convertPoint:point toView:self.popBtn];
        // 当触摸点在控件上时才响应
        if ([self.popBtn pointInside:popBtnP withEvent:event]) {
            return self.popBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }else{
        return [super hitTest:point withEvent:event];
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸数据
    UITouch *touch  = [touches anyObject];
    //获取触摸上一个点的位置
    CGPoint curP = [touch locationInView:self];
    //获取触摸的当前位置
    CGPoint preP = [touch previousLocationInView:self];
    CGFloat  offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    self.transform = CGAffineTransformTranslate(self.transform, offsetX,offsetY);
}
@end
