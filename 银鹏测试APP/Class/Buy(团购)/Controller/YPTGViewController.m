//
//  YPTGViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/11/2.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPTGViewController.h"
#import "YPtgMode.h"
#import "YPTGView.h"
@interface YPTGViewController()   // ------需要继承的方法
@property(strong,nonatomic)NSArray *TGgroups;
@end
@implementation YPTGViewController


/**
 设置缓存数据
 */
-(NSArray *)TGgroups{
    if(!_TGgroups){
        NSArray *TGarray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"]];
        NSMutableArray *array = [NSMutableArray array];      //创建一个可变数组
        for (NSDictionary *arrays in TGarray) {     //将数组转换为模型
            [array addObject:[YPtgMode tgWithDict:arrays]];  //将模型的值传给数组
        }
            _TGgroups = array;
    }
    return _TGgroups;
}

// ------设置标志
NSString *ID2 = @"B";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 70;
    // ------注册标志符
    [self.tableView registerClass:[YPTGView class] forCellReuseIdentifier:ID2];
}

/**
 设置有几组数据（默认为1)
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/**
 设置每组有多少行数据
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.TGgroups.count;
}


/**
 实现数据源
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // ------访问缓存池
    YPTGView *cell = [tableView dequeueReusableCellWithIdentifier:ID2];
    /*
     完整的为：
     static NSSTring *ID = @"tg"'
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
     if(cell == nil){
     cell = [[XMGTgCEll alloc] initWithStyle:UITabelViewCellStuleDefaultReuseIdentifier:ID];
     */
    // ------设置数据
    cell.tg = self.TGgroups[indexPath.row];
    return cell;
}

@end
