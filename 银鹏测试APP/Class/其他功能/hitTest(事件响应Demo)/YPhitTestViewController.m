//
//  YPhitTestViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/28.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPhitTestViewController.h"
#import "YPhitButton.h"
@interface YPhitTestViewController ()

@end

@implementation YPhitTestViewController
- (IBAction)btnClick:(YPhitButton *)sender {
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    sender.popBtn = btn;
    btn.frame =  CGRectMake(100, -80, 100, 80);
    [sender addSubview:btn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
