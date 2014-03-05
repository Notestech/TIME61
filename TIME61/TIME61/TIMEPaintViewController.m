//
//  TIMEPaintViewController.m
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEPaintViewController.h"
#import "PaintCollectionCell.h"
#import "TIMEPaintDetailViewController.h"
#import "PaintsModel.h"
#import "WebRequest.h"

@interface TIMEPaintViewController ()

@end

@implementation TIMEPaintViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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

#pragma mark -loadData
-(void)setupCollectionView
{
    //遍历解析多层JSON数据http://time61/api/newsays.php
    
//     NSDictionary *dataDic = [WebRequest requestJSON:@"http://time61/api/paintings.php"];
//     
//     NSArray *keys = [dataDic allKeys];
//     
//     id key,painting;
//     NSArray *value;
//     NSMutableArray *paintings = [[NSMutableArray alloc] init];
//     
//     //遍历字典
//     for (int i = 0;i < keys.count; i++) {
//     key = [keys objectAtIndex:i];
//     value = [dataDic objectForKey:key];
//     
//     painting = [value objectAtIndex:0];
//     //  NSLog(@"painting:%@",painting);
//     [paintings addObject:painting];
//     
//     }
//    NSLog(@"%d",[paintings count]);
//     self.data = paintings;
    
    
    NSArray *dataArray = [WebRequest requestJSON:@"http://time61/api/paintings.php"];
//    NSArray *dataArray = [WebRequest requestJSON:@"http://time61/api/newsays.php"];
    
    
    
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
    
//    [self.collectionView reloadData];
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
    if (cell == nil) {
        cell = [[PaintCollectionCell alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    }
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


@end
