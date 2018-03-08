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
/**队列*/
@property (nonatomic,strong)   NSOperationQueue *queue;
/**缓存操作*/
@property (nonatomic,strong)   NSMutableDictionary *operations;
@end

@implementation YPDownloadViewController
-(NSOperationQueue *)queue{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc]init];
        _queue.maxConcurrentOperationCount = 5;
    }
    return _queue;
}
-(NSMutableDictionary *)operations{
    if (_operations == nil) {
        _operations = [NSMutableDictionary dictionary];
    }
    return _operations;
}
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
        
        if (imageData) {    //如果沙盘缓存中有图片数据则直接设置图片
            UIImage *image = [UIImage imageWithData:imageData];
            cell.imageView.image = image;
            //把图片保存到缓存中
            [self.images  setObject:image forKey:appM.icon];
        }else{
            //检查该图片是否正在下载（防止在多线程情况下，由于下载缓慢，在图片还没有下载完成时，又要重新显示该图片
            NSBlockOperation *download = [self.operations objectForKey:appM.icon];
            if (download) {
                //如果图片正在下载则等待图片下载完成
            }else{
                //设置站位图片（防止cell重引用时引用其他cell的图片
                cell.imageView.image = [UIImage imageNamed:@"yp"];
                // 创建子线程下载图片
                download = [NSBlockOperation blockOperationWithBlock:^{
                    NSURL *url = [NSURL URLWithString:appM.icon];
                    NSData *imageData = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:imageData];
                    //容错操作，如果图片没有数据则把线程操作移除，以便下次重新刷新时下载
                    if (image == nil) {
                        [self.operations removeObjectForKey:appM.icon];
                        return ;
                    }
                    //把图片保存到内存缓存中
                    [self.images setObject:image forKey:appM.icon];
                    //把刷新操作放在主线程中主动刷新，线程间通信
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
                    }];
                    //写数据到沙盒
                    [imageData writeToFile:fullPath atomically:YES];
                    //移除图片的下载操作（下载完成）
                    [self.operations removeObjectForKey:appM.icon];
                }];
                //添加操作到操作缓存中（因为开了多线程，代码可能会先一直调用显示操作。就需要重新下载图片，所以使用操作缓存加以限制≤
                [self.operations setObject:download forKey:appM.icon];
                //添加操作到队列中（让队列运行操作)
                [self.queue addOperation:download];
            }
        }
    }
    return cell;
}
@end
