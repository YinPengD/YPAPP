//
//  YPTableViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/5.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPTableBarViewController.h"
#import "YPAccountController.h"
#import "YPTGViewController.h"
#import "DiscoverViewController.h"
#import "YPStatusViewController.h"

@interface YPTableBarViewController ()

@end

@implementation YPTableBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DiscoverViewController *musicVC = [[DiscoverViewController alloc]init];
    [self setupOneChaildViewContoller:musicVC name:@"音乐" image:[UIImage imageNamed:@"barmusic1"]];
    YPStatusViewController *statusVC = [[YPStatusViewController alloc]init];
    [self setupOneChaildViewContoller:statusVC name:@"动态" image:[UIImage imageNamed:@"friends"]];
    YPTGViewController *tgVC = [[YPTGViewController alloc]init];
    [self setupOneChaildViewContoller:tgVC name:@"购物" image:[UIImage imageNamed:@"barmusic2"]];
    YPAccountController *accountVC = [[YPAccountController alloc]init];
    [self setupOneChaildViewContoller:accountVC name:@"账号" image:[UIImage imageNamed:@"account"]];
}
/**
 对TabBar元素初始化的封装
 
 @param vc 控制器
 @param image 按钮显示图片
 */
-(void)setupOneChaildViewContoller:(UIViewController *)vc name:(NSString *)name image:(UIImage *)image{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    vc.tabBarItem.image = image;
    vc.tabBarItem.title =name;
    //[self addChildViewController:vc];
}

@end
