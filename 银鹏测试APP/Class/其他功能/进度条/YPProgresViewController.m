//
//  YPProgresViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/2/3.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPProgresViewController.h"
#import "YPProgressView.h"
@interface YPProgresViewController ()
@property (weak, nonatomic) IBOutlet UILabel *valuetitle;
@property (weak, nonatomic) IBOutlet YPProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;


@end

@implementation YPProgresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 0.加载图片
    UIImage *image = [UIImage imageNamed:@"yp"];
    // 1.开启一个一个有图片同样大的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 2.把图片回执到上下文当中
    [image drawAtPoint:CGPointZero];
    // 3.把文字绘制到上下文当中
    NSString *str =@"银鹏APP";
    [str drawAtPoint:CGPointMake(170, 200) withAttributes:nil];
    // 4.根据上下文的绘制结果生成图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5.结束上下文
    UIGraphicsEndImageContext();
    self.imageV.image = newImage;
    

}
- (IBAction)valuechange:(UISlider *)sender {
    //要显示%时，需要打%%表示
        self.valuetitle.text = [NSString stringWithFormat:@"%.2f%%",sender.value *100];
    self.progressView.progressValue = sender.value;
}


@end
