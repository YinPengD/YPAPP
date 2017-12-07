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
@property (nonatomic,strong)   NSMutableArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation YPRefurbishViewController

/**
 懒加载酒数据
 */
-(NSMutableArray *)wineArray{
    if (!_wineArray) {
        _wineArray = [YPWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 添加按钮
 */
- (IBAction)add {
    YPWine *wine = [[YPWine alloc]init];
    wine.name = @"女儿红";
    wine.money = @"44.2";
    wine.image = @"newWine";
    [self.wineArray insertObject:wine atIndex:0];
    // 使tableView强制刷新
    [self.tableView reloadData];
}

/**
 更新按钮
 */
- (IBAction)Update {
    YPWine *wine1 = self.wineArray[0];
    wine1.money = @"100";
    [self.tableView reloadData];
}

/**
 移除按钮
 */
- (IBAction)remove {
    [self.wineArray removeObjectAtIndex:0];
    [self.tableView   reloadData];
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
