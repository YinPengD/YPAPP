//
//  AppDelegate.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/8/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // ------1.创建窗口（强引用窗口，不让窗口消失），然后设置尺寸
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RootViewController *rootVC = [[RootViewController alloc]init];
    // ------2.设置窗口的根控制器
    // ------3.创建导航控制器
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    //initWithRootViewController底层调用pushViewController
    //把一个控制器添加到导航控制器中
   // [nav pushViewController:vc animated:YES];
    // ------自定义颜色
    UIColor *barColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:0.5];
    // ------修改颜色
    nav.navigationBar.barTintColor = barColor;
    //------4.显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
