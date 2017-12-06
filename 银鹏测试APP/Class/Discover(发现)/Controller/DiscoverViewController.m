//
//  DiscoverViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/8/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "DiscoverViewController.h"
#import "YPPageView.h"
#import "Masonry.h"
@interface DiscoverViewController ()
@end
@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ------设置导航条的内容，由栈顶控制器决定
    //self.navigationItem.title = @"根控制器" ;
    // ------创建一个文本框
    UITextField  *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 8, 200, 25)];
    // ------设置文本框背景颜色
    textField.backgroundColor = [UIColor whiteColor];
    // ------设置文本框样式
    textField.borderStyle = UITextBorderStyleRoundedRect;
    // ------设置水印文字
    textField.placeholder =@"搜索音乐、歌词、电台";
    // ------设置paceholder的属性
    [textField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    self.navigationItem.titleView = textField;
    // ------设置文本框左视图
    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Search" ]];
    textField.leftView = imageview;
    textField.leftViewMode = UITextFieldViewModeAlways;
    // ------设置左侧是一个自定义的view（位置不需要自己决定但是大小要自己决定
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"Mic"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"Mic"] forState:UIControlStateHighlighted];
    // ------让按钮自定义大小
    [btn1 sizeToFit]; 
    // ------监控按钮事件
    [btn1 addTarget:self action: @selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    // ------添加
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    
    // ------设置右侧自定义button
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"Wave"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"Wave"] forState:UIControlStateHighlighted];
    [btn2 sizeToFit];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem  =[[UIBarButtonItem alloc] initWithCustomView:btn2];
    
    // ------创建选项卡
    NSArray *items = [NSArray arrayWithObjects:@"个性推荐",@"推荐",@"主播电台",@"歌单" ,nil];
    UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithItems:items];
    segmented.frame = CGRectMake(0, 64, [[UIScreen mainScreen]bounds].size.width, 30);
    [self.view addSubview:segmented];
    
    // ------创建一个YPPageView类
    YPPageView *pageView =  [YPPageView pageView]; //注意：这样的写法存在有性能问题1.如果照片数量大了，加载的图片数量就过多了2.创建的image过多
    pageView.imageNames  = @[@"img_01",@"img_02",@"img_03",@"img_04"];
    [self.view addSubview:pageView];
    // -------对pageView进行约束
    pageView.translatesAutoresizingMaskIntoConstraints  = NO;
    [pageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.left.offset(0);
        make.top.mas_equalTo(segmented.mas_bottom).offset(0);
        make.bottom.mas_equalTo(segmented.mas_bottom).offset(134);
    }];
    //背景默认为黑色
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - *************** 监控点击与跳转事件
//监控按钮1的事件
-(void)btn1Click{
    NSLog(@"%s",__func__);
}
-(void)btn2Click{
    NSLog(@"%s",__func__);
}
/*
- (IBAction)JumpNext:(id)sender {
    //跳转控制区器
    //self.navigationController获取当前所在导航控制器
    MyMusicViewController *twoVC = [[MyMusicViewController alloc]init];
    [self.navigationController pushViewController:twoVC animated:YES];
}
- (IBAction)jumpStatus:(id)sender {
    //UIStoryboard *one = [UIStoryboard storyboardWithName:@"YPStatusController" bundle: nil];
    //YPStatusController *Set = [one instantiateViewControllerWithIdentifier:@"1234"];
    //[self.navigationController pushViewController:Set animated:YES];
    YPStatusController *status = [[YPStatusController alloc]init];
    [self.navigationController pushViewController:status animated:YES];
}
*/
@end
