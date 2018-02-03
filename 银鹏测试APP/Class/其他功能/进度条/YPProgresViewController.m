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

@end

@implementation YPProgresViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)valuechange:(UISlider *)sender {
    //要显示%时，需要打%%表示
        self.valuetitle.text = [NSString stringWithFormat:@"%.2f%%",sender.value *100];
    self.progressView.progressValue = sender.value;
}


@end
