//
//  YPRefurbishViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/6.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPRefurbishViewController.h"
#import "YPRefurbishTableViewCell.h"
#import "MJExtension.h"
#import "YPWine.h"
@interface YPRefurbishViewController ()<UITableViewDataSource>   //注意如果不是继承tableViewcontroller 就需要添加数据代理与在storyboard中设置数据源
/**酒数据*/
@property (nonatomic,strong)   NSArray *wineArray;
@end

@implementation YPRefurbishViewController

/**
 懒加载酒数据
 */
-(NSArray *)wineArray{
    if (!_wineArray) {
        _wineArray = [YPWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *ID3 = @"refurbish";
    YPRefurbishTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID3];
    if (cell  == nil) {
        cell = [[YPRefurbishTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID3];
    }
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}

@end
