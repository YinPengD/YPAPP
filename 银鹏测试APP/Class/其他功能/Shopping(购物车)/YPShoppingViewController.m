//
//  YPShpppingViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/13.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPShoppingViewController.h"
#import "YPShoppingCell.h"
#import "YPWine.h"
#import "MJExtension.h"
@interface YPShoppingViewController ()<UITableViewDataSource>
/**酒的数据*/
@property (nonatomic,strong)   NSArray *winesArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@end

@implementation YPShoppingViewController

/**
 懒加载酒数据
 */
-(NSArray *)winesArrary{
    if (!_winesArray) {
        _winesArray = [YPWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _winesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 监听通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(plusClick: ) name:@"plusClickNotification" object:nil];
     [center addObserver:self selector:@selector(minusClick: ) name:@"minusClickNotification" object:nil];
}

/**
 移除监听
 */
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark - *************** 监听通知
-(void)plusClick:(NSNotification *)note{
    // 发布者
    YPShoppingCell *cell = note.object;
    //计算总价
    int totalPrice = self.totalPriceLabel.text.intValue + cell.wines.money.intValue;
    //设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
    self.buyButton.enabled  = YES;
}
-(void)minusClick:(NSNotification *)note{
    // 发布者
    YPShoppingCell *cell = note.object;
    //计算总价
    int totalPrice = self.totalPriceLabel.text.intValue - cell.wines.money.intValue;
    //设置总价
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
    self.buyButton.enabled = (totalPrice > 0);
}
- (IBAction)Clear {
    self.totalPriceLabel.text = @"0";
    // 修改模型
    for (YPWine *wine in self.winesArray) {
        wine.count = 0;
    }
    [self.tableView reloadData];
    // 购买按钮不能点击
    self.buyButton.enabled = NO;
}
- (IBAction)buy {
    for (YPWine *wine in self.winesArray) {
        if (wine.count) {
            NSLog(@"购买了%d瓶%@",wine.count,wine.name);
        }
    }
}
#pragma mark - *************** UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.winesArrary.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID5 = @"shopping";
    YPShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID5];
    cell.wines = self.winesArrary[indexPath.row];
    return cell;
}

@end
