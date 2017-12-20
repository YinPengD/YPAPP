//
//  YPSettingTableViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/19.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPSettingTableViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface YPSettingTableViewController ()

@end

@implementation YPSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
         UISwitch *YPSwitch = [[UISwitch alloc]init];
        [cell setAccessoryView:YPSwitch];
        [YPSwitch addTarget:self action:@selector(YPSwitchAction:) forControlEvents:UIControlEventAllEvents];
        cell.textLabel.text = @"是否允许新消息提醒？";
    }else if (indexPath.row == 1){
        cell.accessoryType = UITableViewCellAccessoryNone;
        UISwitch *YPSwitch1 = [[UISwitch alloc]init];
        [cell setAccessoryView:YPSwitch1];
        [YPSwitch1 addTarget:self action:@selector(YPSwitchAction1:) forControlEvents:UIControlEventAllEvents];
        cell.textLabel.text = @"是否隐藏状态栏";
    }
    return cell;
}
-(void)YPSwitchAction:(id)sender{
    UISwitch *YPSwitch = (UISwitch *)sender;
    BOOL isSwitchOn = [YPSwitch isOn];
    if (isSwitchOn) {
        UIApplication *app = [UIApplication sharedApplication];
        //[UNUserNotificationCenter currentNotificationCenter].delegate = app;
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                // 点击允许
                NSLog(@"注册成功");
                [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                    NSLog(@"%@", settings);
                }];
                //[[UIApplication sharedApplication]registerForRemoteNotifications];
            } else {
                // 点击不允许
                NSLog(@"注册失败");
            }
        }];
        app.applicationIconBadgeNumber = 10;
    }
}
-(void)YPSwitchAction1:(id)sender{
    UISwitch *YPSwitch1 = (UISwitch *)sender;
    BOOL isSwitchOn = [YPSwitch1 isOn];
    if (isSwitchOn) {
        UIApplication *app = [UIApplication sharedApplication];
        app.statusBarHidden = YES;
    }else{
        UIApplication *app = [UIApplication sharedApplication];
        app.statusBarHidden = NO;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {View controller-based status bar appearance
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
