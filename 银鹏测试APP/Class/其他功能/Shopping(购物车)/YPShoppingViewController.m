//
//  YPShpppingViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/12/13.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "YPShoppingViewController.h"
#import "YPShoppingCell.h"
@interface YPShoppingViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YPShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark - *************** UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID5 = @"shopping";
    YPShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID5];
    return cell;
}
@end
