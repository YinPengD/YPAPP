//
//  YPAccount.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/5.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPAccount.h"
#import "YPSetting.h"
@interface YPAccount ()

@end

@implementation YPAccount
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell    alloc]init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text  = @"关于";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //YPSetting *Set = [[YPSetting alloc]init];
            UIStoryboard *one = [UIStoryboard storyboardWithName:@"YPSetting" bundle: nil];
            YPSetting *Set = [one instantiateViewControllerWithIdentifier:@"123"];
            [self.navigationController pushViewController:Set animated:YES];
        }
    }
}

@end
