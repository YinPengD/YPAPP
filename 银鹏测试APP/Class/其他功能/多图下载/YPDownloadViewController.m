//
//  YPDownloadViewController.m
//  银鹏测试APP
//
//  Created by 银鹏 on 2018/3/6.
//  Copyright © 2018年 银鹏. All rights reserved.
//

#import "YPDownloadViewController.h"
#import "YPDownload.h"
@interface YPDownloadViewController ()
/**tableView的数据源*/
@property (nonatomic,strong)   NSArray *apps;
/**缓存数据*/
@property (nonatomic,strong)   NSMutableDictionary *images;
@end

@implementation YPDownloadViewController
-(NSMutableDictionary *)images{
    if (_images == nil) {
        _images =[NSMutableDictionary dictionary];
    }
    return _images;
}
-(NSArray *)apps{
    if (_apps == nil) {
        NSArray *arrayM = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in arrayM) {
            [arrM addObject:[YPDownload appWithDict:dict]];
        }
        _apps = arrM;
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        //NSLog(@"%@",self.apps.count);
    return self.apps.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID5 = @"app1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID5];
    YPDownload *appM = self.apps[indexPath.row];
    cell.textLabel.text = appM.name;
    cell.detailTextLabel.text = appM.download;
    //设置图片
    UIImage *image = [self.images objectForKey:appM.icon];
    if (image) {
        cell.imageView.image = image;
    }else
    {
        //保存图片到沙盒缓存中
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        //获取图片的名称，不包含/，取最后一节
        NSString *fileName = [appM.icon lastPathComponent];
        //拼接图片全路径
        NSString *fullPath = [caches stringByAppendingPathComponent:fileName];
        //检查磁盘全路径
        NSData *imageData = [NSData dataWithContentsOfFile:fullPath];
        if (imageData) {
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imageView.image = image;
            //把图片保存太缓存中
            [self.images  setObject:image forKey:appM.icon];
        }else{   //
            NSURL *url = [NSURL URLWithString:appM.icon];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imageView.image = image;
            //保存图片到内存缓存
            [self.images  setObject:image forKey:appM.icon];
            //写数据到沙盒
            [imageData writeToFile:fullPath atomically:YES];
        }
    }
    return cell;
}
@end
