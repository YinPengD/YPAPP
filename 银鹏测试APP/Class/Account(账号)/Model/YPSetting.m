//
//  YPSetting.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/5.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPSetting.h"

@interface YPSetting ()

@end

@implementation YPSetting
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 2) {
            UIApplication *app  = [UIApplication sharedApplication];
            NSURL *url = [NSURL URLWithString:@"https://github.com/YinPengD/YPAPP"];
            [app openURL:url options:@{} completionHandler:nil];
        }
    }
}
@end
