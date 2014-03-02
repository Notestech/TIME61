//
//  TIMEPaintViewController.m
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEPaintViewController.h"
#import "PaintCollectionCell.h"
#import "UIImage+WebCache.h"
#import "TIMEPaintDetailViewController.h"
#import "PaintsModel.h"

@interface TIMEPaintViewController ()

@end

@implementation TIMEPaintViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setupCollectionView
{
    //遍历解析多层JSON数据
    /*
     NSDictionary *dataDic = [self requestJSON:@"http://time61/api/paintings.php"];
     
     NSArray *keys = [dataDic allKeys];
     
     id key,painting;
     NSArray *value;
     NSMutableArray *paintings = [[NSMutableArray alloc] init];
     
     //遍历字典
     for (int i = 0;i < keys.count; i++) {
     key = [keys objectAtIndex:i];
     value = [dataDic objectForKey:key];
     
     painting = [value objectAtIndex:0];
     //  NSLog(@"painting:%@",painting);
     [paintings addObject:painting];
     
     }
     self.data = paintings;
     */
    
    NSArray *dataArray = [self requestJSON:@"http://time61/api/paintings.php"];
    NSMutableArray *paintsArray = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    
    for (NSDictionary *paintDic in dataArray) {
        PaintsModel *paintsModel = [[PaintsModel alloc] initWithDataDic:paintDic];
        [paintsArray addObject:paintsModel];
    }
    self.data = paintsArray;
    
    //设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //创建布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(100, 200)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //应用布局
    [self.collectionView setCollectionViewLayout:layout];
}

#pragma mark - UICollectionViewDataSource Method----------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.data count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"paintCollectionCell";
    PaintCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    PaintsModel *paintsModel = [self.data objectAtIndex:indexPath.row];
    cell.paintsModel = paintsModel;
    return cell;
}

#pragma mark - UICollectionViewDelegate Method----------------

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TIMEPaintDetailViewController *detailVC = [[TIMEPaintDetailViewController alloc] init];
    detailVC.paintsModel = [self.data objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}


#pragma mark -自定义的方法
//请求多层JSON数据,pintings.php里的array_to_json_string方法在to string后返回的就是一个多层的JSON数据,需要配合setupCollectionView方法里的遍历方法完成JSON的解析
/*
 -(NSDictionary *)requestJSON:(NSString *)urlString
 {
 //    NSURL *url = [NSURL URLWithString:@"http://time61/api/paintings.php"];
 NSURL *url = [NSURL URLWithString:urlString];
 
 NSData *data = [NSData dataWithContentsOfURL:url];
 NSError *error;
 id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
 if (error) {
 NSLog(@"Parse JSON:%@",error);
 }
 if (json == nil) {
 return nil;
 }
 return json;
 }
 */
//请求只有一层的JSON数据
-(NSMutableArray *)requestJSON:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    NSMutableArray *json = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    if (json == nil) {
        return nil;
    }
    return json;
}

@end
