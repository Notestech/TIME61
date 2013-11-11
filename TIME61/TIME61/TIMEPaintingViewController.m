//
//  TIMEPaintingViewController.m
//  TIME61
//
//  Created by zhibincai on 11/10/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "TIMEPaintingViewController.h"
#import "PaintingViewCell.h"
#import "UIImage+WebCache.h"
#import "TIMEPaintingDetailViewController.h"

@interface TIMEPaintingViewController ()

@end

@implementation TIMEPaintingViewController

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
    NSDictionary *dataDic = [self requestJSON:@"http://time61/api/paintings.php"];

    NSArray *keys = [dataDic allKeys];
    
    id key,painting;
    NSArray *value;
    NSMutableArray *paintings = [[NSMutableArray alloc] init];

/*遍历字典*/
    for (int i = 0;i < keys.count; i++) {
        key = [keys objectAtIndex:i];
        value = [dataDic objectForKey:key];

        painting = [value objectAtIndex:0];
//        NSLog(@"painting:%@",painting);
        [paintings addObject:painting];

    }
    
    self.data = paintings;
    
    //设置背景色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //创建布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setItemSize:CGSizeMake(100, 160)];
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
    PaintingViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintingViewCell" forIndexPath:indexPath];
    
    NSArray *cellArray = [self.data objectAtIndex:indexPath.row];
//    NSLog(@"cellmarray:%@",(NSString *)[cellArray valueForKey:@"paintingURL"]);
    NSString *lableString = [NSString stringWithFormat:@"分享:%@ 喜欢:%@ 收藏:%@",[cellArray valueForKey:@"share_count"],[cellArray valueForKey:@"love_count"],[cellArray valueForKey:@"comment_count"]];
    cell.userLable.text = [cellArray valueForKey:@"owner"];
    
    cell.barLable.text = lableString;
    cell.paintingView.image = [UIImage imageWithURL:[cellArray valueForKey:@"paintingURL"]];
    
    return cell;
}
#pragma mark - UICollectionViewDelegate Method----------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    TIMEPaintingDetailViewController *detailVC = [[TIMEPaintingDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
#pragma mark -自定义的方法
//请求JSON数据
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

@end
