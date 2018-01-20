//
//  YPAccount.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/5.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPAccountController.h"
#import "MyMusicViewController.h"
#import "YPRefurbishViewController.h"
#import "YPShoppingViewController.h"
#import "YPSettingTableViewController.h"
#import "YPMySelfTableViewController.h"
#import "YPhitTestViewController.h"
#import "YPTransformView.h"
#import "YPSetting.h"
#import "YPDragerViewController.h"
@interface YPAccountController ()

@end

@implementation YPAccountController
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell    alloc]init];
    if (indexPath.section == 0) {
        if (indexPath.row == 0)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text  = @"关于";
        }
        else if (indexPath.row == 1)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"我的音乐";
        }
        else if (indexPath.row == 2)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"数据刷新";
        }
        else if (indexPath.row == 3)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"购物车";
        }
        else if(indexPath.row == 4)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text =  @"设置";
        }
        else if(indexPath.row == 5)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"我的资料";
        }
        else if (indexPath.row == 6)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"视图移动动画";
        }
        else if (indexPath.row == 7)
        {
            cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"事件响应Demo";
        }else if (indexPath.row == 8)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"抽屉效果Demo";
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0)
        {
            //YPSetting *Set = [[YPSetting alloc]init];
            UIStoryboard *one = [UIStoryboard storyboardWithName:@"YPSetting" bundle: nil];
            YPSetting *Set = [one instantiateViewControllerWithIdentifier:@"01"];
            [self.navigationController pushViewController:Set animated:YES];
        }
        else if (indexPath.row == 1)
        {
            MyMusicViewController *two = [[MyMusicViewController alloc]init];
            [self.navigationController pushViewController:two animated:YES];
        }
        else if (indexPath.row == 2)
        {
            UIStoryboard *thr = [UIStoryboard storyboardWithName:@"YPRefurbishView" bundle:nil];
            YPRefurbishViewController *Refurbish = [thr instantiateViewControllerWithIdentifier:@"02"];
            [self.navigationController pushViewController:Refurbish animated:YES];
        }
        else if (indexPath.row == 3)
        {
            UIStoryboard *four = [UIStoryboard storyboardWithName:@"YPShoppingView" bundle:nil];
            YPShoppingViewController *Shopping = [four instantiateViewControllerWithIdentifier:@"03"];
            [self.navigationController pushViewController:Shopping animated:YES];
        }
        else if (indexPath.row == 4)
        {
        YPSettingTableViewController *five = [[YPSettingTableViewController alloc]init];
        [self.navigationController pushViewController:five animated:YES];
        }
        else if (indexPath.row == 5)
        {
            YPMySelfTableViewController *six =[[YPMySelfTableViewController alloc]init];
            [self.navigationController pushViewController:six animated:YES];
        }
        else if (indexPath.row == 6)
        {
            UIStoryboard *seven = [UIStoryboard storyboardWithName:@"YPTransformView" bundle:nil];
            YPTransformView *trans = [seven instantiateViewControllerWithIdentifier:@"04"];
            [self.navigationController pushViewController:trans animated:YES];
        }
        else if (indexPath.row == 7)
        {
            UIStoryboard *eight = [UIStoryboard storyboardWithName:@"YPhitTestViewController" bundle:nil];
            YPhitTestViewController *hit = [eight instantiateViewControllerWithIdentifier:@"05"];
            [self.navigationController pushViewController:hit animated:YES];
        }else if (indexPath.row == 8)
        {
            YPDragerViewController *nine = [[YPDragerViewController alloc]init];
            [self.navigationController pushViewController:nine animated:YES];
        };
}
}
@end
