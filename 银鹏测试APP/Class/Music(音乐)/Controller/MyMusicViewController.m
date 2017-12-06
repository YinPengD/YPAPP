//
//  MyMusicViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2017/8/7.
//  Copyright © 2017年 银鹏. All rights reserved.
//

#import "MyMusicViewController.h"
#import "dict_mode.h"
#import "Mode.h"
@interface MyMusicViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//所有的数据
@property(nonatomic,strong) NSArray *Groups;
@end

@implementation MyMusicViewController
//懒加载
-(NSArray *)Groups{
    if (!_Groups) {
        //加载文件（字典数组)
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"list" ofType:@"plist"]];
        //NSLog(@"%@",dictArray);
        //创建模型数组
        NSMutableArray *temp = [NSMutableArray array];
        //字典数组->模型数组
        for (NSDictionary  *GroupDict in dictArray) {
            dict_mode *group = [dict_mode modeGropWithDict:GroupDict];
            [temp addObject:group];
        }
        _Groups = temp;
    }
    return  _Groups;
}



static NSString *ID = @"A";
- (void)viewDidLoad {
    [super viewDidLoad];
    //数据来源(可以进行脱线处理)
    self.tableView.dataSource = self;
    //设置调用的方法为自身
    self.tableView.delegate = self;
    //根据ID 这个标识 注册对应的cell类型 为UITableViewCell(只注册一次）(一般使用在自定义cell）
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}
//告诉tableView一共有多少组数据 不设置默认为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
    //return self.Groups.count;
}
//tabel第section组有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    dict_mode *group = self.Groups[section];
    return group.list.count;
}
//table每一行的显示内容（每当有一个cell进入视野就会调用)
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //UITableViewCell*cells = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil]; //设置风格,文字在底部
    //设置右边指示样式
    //static NSString *ID = @"A";  //定义一个局部表示：使用静态变量的原因是使ID类型的生命周期为整个程序，而不改变变量的作用域
    
    //1.去缓存池取是否有可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //如果缓存池中没有可循环利用的cell，自己创建
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        //如果有重复一样的设定cell的操作，放在这个判断里面做，因为这个判断里面调用的次数少
//    }
//    //取出indexPath.section的数据
    dict_mode *group = self.Groups[indexPath.section];
//    //取出indexPath.row的数据
    Mode *m = group.list[indexPath.row];
    cell.textLabel.text =m.name;
    //NSLog(@"%p--%zd",cell,indexPath.row);
   cell.imageView.image = [UIImage imageNamed:m.icon];
    return cell;
}
//创建tableView的每一组头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
            dict_mode *mode = self.Groups[section];
        return mode.header;
    }else if (section == 2){
        dict_mode *mode = self.Groups[section];
        return mode.header;
    }else{
        return nil;
    }
}
//创建table每一组的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return nil;
}
@end
