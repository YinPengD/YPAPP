//
//  YPStatusController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPStatusController.h"
#import "YPStatus.h"
#import "YPStatusCell.h"
#import "MJExtension.h"
@interface YPStatusController ()
@property(nonatomic,strong) NSArray *statuses;
@end

@implementation YPStatusController


/**
 用第三方框架进行字典转模型
 */
-(NSArray *)statuses{
    if (!_statuses) {
        _statuses  = [YPStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}
NSString *ID1 = @"status";
- (void)viewDidLoad {
    [super viewDidLoad]; 
    // ------注册标志
    [self.tableView registerClass:[YPStatusCell class] forCellReuseIdentifier:ID1];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.statuses.count;
}

/**
 设置每一行的数据源
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YPStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID1];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

/**
 设置每一行的不同高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    YPStatus *status = self.statuses[indexPath.row];
// ------通过在设置cell的的布局之前提前计算cell的高度设置不同高度（因为这个函数会在设置数据之前调用)
    return status.cellHeight;
}


@end
