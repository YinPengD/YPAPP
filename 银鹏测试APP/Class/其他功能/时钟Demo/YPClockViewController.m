
//
//  YPClockViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/2/26.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPClockViewController.h"
//每一秒读数
#define perSecA 6
//宏  ----宏名（）：
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)
@interface YPClockViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ClockView;

/** 秒钟 */
@property(nonatomic,weak) CALayer  *secL;
@end

@implementation YPClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setSec];
    // ------创建一个定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];
}
-(void)timeChange {
    // ------调用当前时间
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [cal components:NSCalendarUnitSecond fromDate:[NSDate date]];
    // ------获取当前时间的秒数
    NSInteger curSec = cmp.second;
    // ------分针开始旋转
    CGFloat secA = curSec * perSecA;
    self.secL.transform = CATransform3DMakeRotation(angle2Rad(secA), 0, 0, 1);
    
    
    
}
-(void)setSec{
    CALayer *secL = [CALayer layer];
    secL.bounds = CGRectMake(0, 0, 1, 80);
    secL.backgroundColor = [UIColor redColor].CGColor;
    // ------设置锚点
    secL.anchorPoint = CGPointMake(0.5, 1);
    // ------设置位置
    secL.position = CGPointMake(self.ClockView.bounds.size.width * 0.5, self.ClockView.bounds.size.height * 0.5);
    [self.ClockView.layer addSublayer:secL];
    self.secL = secL;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 所有的旋转，播放都是让着锚点进行的
    self.secL.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
}

@end
