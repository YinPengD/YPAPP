//
//  YPDragerViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/1/20.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPDragerViewController.h"
#import "YPDragerTableViewController.h"
#define screenW [UIScreen mainScreen].bounds.size.width
@interface YPDragerViewController ()
/** 左视图 */
@property(nonatomic,weak) UIView  *leftV;
/** 右视图 */
@property(nonatomic,weak) UIView  *rightV;
/** 主视图 */
@property(nonatomic,weak) UIView  *mainV;
//@property(nonatomic,weak,readonly) UIView  *mainV; //readonly的本质是不让重写set方法，禁止子类修改父类原有的属性方法
@end

@implementation YPDragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控件
    [self setUp];
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    //添加点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    // 添加TableViewController
    YPDragerTableViewController *vc1 = [[YPDragerTableViewController alloc]init];
    vc1.view.frame = self.mainV.bounds;
    [self.mainV addSubview:vc1.view];
    //当一个控制器的View添加到另一个控制器的view上的时候，那此时view所在的控制器也应该成为上一个控制的子控制器。  //[self addChildViewController:vc1];
}
-(void)tap{
    [UIView animateWithDuration:0.5 animations:^{
        self.mainV.frame = self.view.bounds;
    }];
}
#define targetR 270
#define targetL -270
-(void)pan:(UIPanGestureRecognizer *)pan{
    // 获取偏移量
    CGPoint transP = [pan translationInView:self.mainV];
    //为什么不使用transform,是因为我们还要去修改高度,使用transform,只能修改,x,y
    //self.mainV.transform = CGAffineTransformTranslate(self.mainV.transform, transP.x, 0);
    self.mainV.frame = [self frameWithOffsetX:transP.x];
    if (self.mainV.frame.origin.x >0) {
        //向左
        self.rightV.hidden = YES;
    }else if (self.mainV.frame.origin.x < 0){
        //隐藏左视图
        self.rightV.hidden = NO;
    }
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.mainV.frame.origin.x > screenW * 0.5) {
            target = targetR;
        }else if (CGRectGetMaxX(self.mainV.frame) < screenW * 0.5){
            target = targetL;
        }
        //计算当前mainV的frame.
        CGFloat offset = target - self.mainV.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            self.mainV.frame = [self frameWithOffsetX:offset];
        }];
    }
    //复位
    [pan setTranslation:CGPointZero inView:self.mainV];
}

#define maxY 100

/**
 偏移视图使其造成抽屉效果
 */
-(CGRect)frameWithOffsetX:(CGFloat)offsetX {
    CGRect frame = self.mainV.frame;
    frame.origin.x +=offsetX;
    CGFloat y = fabs(frame.origin.x * maxY /screenW);
    frame.origin.y  =y;
    //高度为减去2倍的y值
    frame.size.height = [UIScreen mainScreen].bounds.size.height - (2 * frame.origin.y);
    return frame;
}

/**
 创建基本的视图
 */
-(void)setUp{
    UIView *leftV = [[UIView alloc]initWithFrame:self.view.bounds];
    leftV.backgroundColor = [UIColor blueColor];
    self.leftV = leftV;
    [self.view addSubview:leftV];
    UIView *rightV = [[UIView alloc]initWithFrame:self.view.bounds];
    rightV.backgroundColor = [UIColor greenColor];
    self.rightV = rightV;
    [self.view addSubview:rightV];
    UIView *mainV = [[UIView alloc]initWithFrame:self.view.bounds];
    mainV.backgroundColor = [UIColor redColor];
    self.mainV = mainV;
    [self.view addSubview:mainV];
}
@end
