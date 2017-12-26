
//
//  YPMySelfTableViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/21.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPMySelfTableViewController.h"
#import "YPMySelfTextField.h"
#import "YPMySelfTableViewCell.h"
@interface YPMySelfTableViewController ()

@end

@implementation YPMySelfTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [[UITableViewCell alloc]init];
    YPMySelfTableViewCell *cell = [[YPMySelfTableViewCell alloc]init];
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.text = @"国家";
    }else if (indexPath.row == 1){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"地区";
    }else if (indexPath.row == 2){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"生日";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YPMySelfTableViewCell *cell = (YPMySelfTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        [cell becomeFirstResponder];
        NSLog(@"%ld",indexPath.row);
}
@end
