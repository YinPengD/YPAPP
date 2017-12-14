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
@interface YPRefurbishViewController ()<UITableViewDataSource,UITableViewDelegate>   //注意如果不是继承tableViewcontroller 就需要添加数据代理与在storyboard中设置数据源
/**酒数据*/
@property (nonatomic,strong)   NSMutableArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *upDateButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButtton;
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
    // tableVIew在编辑模式下中的可以多选，
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    // 没进入编辑界面之前隐藏删除按钮
    self.deleteButtton.hidden = YES;
    self.addButton.hidden = NO;
    self.upDateButton.hidden = NO;
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
    //[self.tableView reloadData];
    // 局部刷新
    NSArray *indexPath = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView insertRowsAtIndexPaths:indexPath withRowAnimation:(UITableViewRowAnimationRight)];
}

/**
 更新按钮
 */
- (IBAction)Update {
    YPWine *wine1 = self.wineArray[0];
    wine1.money = @"100";
    // 全局刷新
    //[self.tableView reloadData];
    // 局部刷新
    NSArray *indexPath = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView reloadRowsAtIndexPaths:indexPath withRowAnimation:UITableViewRowAnimationFade];
}

/**
 移除按钮
 */
- (IBAction)remove {
    //[self.wineArray removeObjectAtIndex:0];
    //[self.tableView   reloadData];
    //NSArray *indexPath = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    //[self.tableView deleteRowsAtIndexPaths:indexPath withRowAnimation:UITableViewRowAnimationLeft];
    // 进入编辑模式
    //self.tableView.editing = !self.tableView.editing;   // 取反
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    // 进入编辑界面之后显示删除按钮，隐藏其他按钮
    self.deleteButtton.hidden = !self.tableView.isEditing;
    self.addButton.hidden   = self.tableView.isEditing;
    self.upDateButton.hidden  =  self.tableView.isEditing;
}
- (IBAction)delete {
    // 用一个可变数组存储被勾选的cell模型，不要一边遍历一边删除元素，因为元素的索引可能会发生变化
    NSMutableArray *deleteWine = [NSMutableArray array];
    for (NSIndexPath *indexPath in self.tableView.indexPathsForSelectedRows) {
        [deleteWine addObject:self.wineArray[indexPath.row]];
    }
    // 删除要删除的酒模型
    [self.wineArray removeObjectsInArray:deleteWine];
    // 刷新表格
    [self.tableView deleteRowsAtIndexPaths:self.tableView.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationLeft];
    // 删除完恢复普通模式
    [self.tableView setEditing:NO animated:YES];
    self.deleteButtton.hidden = YES;
    self.addButton.hidden = NO;
    self.upDateButton.hidden = NO;
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
#pragma mark - *************** 设置右划删除代理事件

/**
 设置右划删除事件
 当点击删除按钮时会调用里面的方法
 */

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.wineArray removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}
 
/**
 设置右划删除按钮的标题
 */

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
/**
 设置多个右划按钮
 */
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        // 默认当右划时进入tableView的编辑模式,如果要使的tableView右划取消的平滑好看，就要取消退出编辑模式
        self.tableView.editing =NO;
    }];
    UITableViewRowAction *action1 = [UITableViewRowAction  rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [self.wineArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }];
    return @[action1,action];
}
@end
