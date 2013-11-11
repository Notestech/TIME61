//
//  TIMEHomeViewController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEHomeViewController.h"
#import "UIImage+WebCache.h"     //添加了imageWithURL方法
#import "ToyModel.h"
#import "CartonViewCell.h"


@interface TIMEHomeViewController ()

@property(strong,nonatomic)NSArray *dataArray;
-(void)setupViews;

@end

@implementation TIMEHomeViewController

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
    [self setupViews];
  

    [self setupMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)setupViews
{
    [self showGuidePictures];
}
-(void)showGuidePictures
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageWithURL:@"http://time61/upload/wheel/wheel_01.png"] tag:1001];
    
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageWithURL:@"http://time61/upload/wheel/wheel_02.png"] tag:1002];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageWithURL:@"http://time61/upload/wheel/wheel_03.png"] tag:1003];
    
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 122) delegate:self focusImageItems:item1,item2,item3, nil];
    imageFrame.switchTimeInterval = 5.f;
    
    
    [self.view addSubview:imageFrame];
    
    //    [[[[UIApplication sharedApplication] delegate] window] addSubview:imageFrame];
}

#pragma mark - SGFocusImageFrameDelegate Method----------------

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    if (item.tag == 1003) {
        [imageFrame removeFromSuperview];
    }
}
-(void)setupMainView
{
    NSArray *dataArray = [self requestJSON:@"http://time61/api/toys.php"];
//    NSLog(@"data array:%@",dataArray);
    self.data = dataArray;
//    NSLog(@"data:%@",self.data);
//    UINib *CartonCellNib = [UINib nibWithNibName:@"CartonCell" bundle:nil];
    
//    [self.collectionView registerNib:CartonCellNib forCellWithReuseIdentifier:@"CartonCell"];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setItemSize:CGSizeMake(320, 160)];
    
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:layout];
    
}
#pragma mark - UICollectionViewDataSource Method----------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.data count];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CartonViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CartonCell" forIndexPath:indexPath];
    
//    ToyModel *toyModel = [self.data objectAtIndex:indexPath.row];
//    cell.toyModel = toyModel;
//    NSLog(@"%@",cell.toyModel.owner);
    
//  /*这是直接取值赋值的解决方法
    NSArray *cellArray = [self.data objectAtIndex:indexPath.row];

    cell.ownerLable.text = [cellArray valueForKey:@"owner"];
    cell.paintingView.image = [UIImage imageWithURL:[cellArray valueForKey:@"paintingURL"]];

    cell.modelView.image = [UIImage imageWithURL:[cellArray valueForKey:@"modelURL"]];

    UILabel *lable;
    UIImageView *paintingView;
    UIImageView *modelView;
    
    lable = (UILabel *)[cell viewWithTag:10];
    paintingView = (UIImageView *)[cell viewWithTag:5];
    modelView = (UIImageView *)[cell viewWithTag:6];

    lable.text = [cellArray valueForKey:@"owner"];
    paintingView.image = [UIImage imageWithURL:[cellArray valueForKey:@"paintingURL"]];
    modelView.image = [UIImage imageWithURL:[cellArray valueForKey:@"modelURL"]];
//*/
    
    return cell;
}

#pragma mark - UICollectionViewDelegate Method----------------

#pragma mark - load data

-(NSMutableArray *)requestJSON:(NSString *)urlString
{
    //    NSURL *url = [NSURL URLWithString:@"http://time61/api/paintings.php"];
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
