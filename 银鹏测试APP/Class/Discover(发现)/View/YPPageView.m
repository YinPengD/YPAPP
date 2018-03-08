//
//  YPPageView.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/10/12.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPPageView.h"
@interface YPPageView ()  <UIScrollViewDelegate>       //设置代理
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(weak,nonatomic)NSTimer *timer;
@end

@implementation YPPageView
-(void)awakeFromNib{
    [super awakeFromNib];
    // ------单页的时候是否隐藏
    self.pageControl.hidesForSinglePage = YES;
    // ------设置定时器
    [self startTimer];
  // self.scrollView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}
-(void)layoutSubviews{
    // ------一定要调用super 不然会重新修改
    [super layoutSubviews];
    
}

+ (instancetype)pageView
{    // ------创建方法的时候反回xib里的控件
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]  lastObject];
}

-(void)setImageNames:(NSArray *)imageNames
{
    _imageNames  = imageNames; //为了使后面访问到ImgaeNames的值
    // ------添加图片
    CGFloat  scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    NSUInteger count = imageNames.count;
    for(int i = 0; i <count ; i++)
    {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame =  CGRectMake(i * scrollViewW, 0, scrollViewW,scrollViewH );
        [self.scrollView addSubview:imageView];
    }
    // ------设置contensize
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    // ------设置总页数
    self.pageControl.numberOfPages = count;
    // ------开启分页功能(以scrollow的尺寸为一页
    self.scrollView.pagingEnabled = YES;
}
#pragma mark - *************** 定时器相关方法,每隔一段时间开启一个定时器
-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:nil repeats:YES]; //函数：userINgo --> 作用：传递一个参数
    // ------目的：不管主线程在做什么操作，都会分配一定的时间处理定时器
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)endTimer{
    [self.timer invalidate]; //调用了invalidate之后time也被销毁了
}

-(void)nextPage:(NSTimer *)timer
{
    // ------1.计算下一页的页码
    NSInteger page = self.pageControl.currentPage +1;
    // ------2.超过了最后一页
    if (page ==_imageNames.count) {
        page = 0;
    }
    // ------3.滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}
// ------设置代理用于滑动图片改变页码
#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // ------1.计算页码
    int page = (scrollView.contentOffset.x / scrollView.frame.size.width)+0.5;
    // ------2.设置页码
    self.pageControl.currentPage = page;
}
// ------用户开始拖拽后，结束定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self endTimer];
    NSLog(@"YES");
}
// ------用户结束拖拽后，开启定时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:nil repeats:YES];
}
@end
