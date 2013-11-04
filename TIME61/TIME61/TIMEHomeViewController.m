//
//  TIMEHomeViewController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEHomeViewController.h"
#import "SDWebImageDownloader.h"

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
    // Dispose of any resources that can be recreated.
}

-(void)setupViews
{
    [self showGuidePictures];
}
-(void)setupMainView
{
    NSMutableArray *aSection = [[NSMutableArray alloc] init];
    NSMutableArray *bSection = [[NSMutableArray alloc] init];
    NSMutableArray *cSection = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 3; i ++) {
        [aSection addObject:[NSString stringWithFormat:@"A%d",i]];
        [bSection addObject:[NSString stringWithFormat:@"B%d",i]];
        [cSection addObject:[NSString stringWithFormat:@"C%d",i]];
        
    }
    
    self.dataArray = [[NSArray alloc] initWithObjects:aSection,bSection,cSection, nil];
    
    UINib *CartonCellNib = [UINib nibWithNibName:@"CartonCell" bundle:nil];
    
    [self.collectionView registerNib:CartonCellNib forCellWithReuseIdentifier:@"CartonCell"];
    
    //    self.collectionView.frame = CGRectMake(0, 64+122, ScreenWidth, 345);
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setItemSize:CGSizeMake(100, 150)];
    
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:layout];
    
}
-(void)showGuidePictures
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageNamed:@"1.jpg"] tag:1001];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageNamed:@"2.jpg"] tag:1002];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageNamed:@"3.jpg"] tag:1003];
    
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

#pragma mark - UICollectionViewDataSource Method----------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *cellArray = [self.dataArray objectAtIndex:section];
    
    return [cellArray count];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *cellArray = [self.dataArray objectAtIndex:indexPath.section];
    NSString *cellString = [cellArray objectAtIndex:indexPath.row];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CartonCell" forIndexPath:indexPath];
    
    UILabel *lable;
    UIImageView *imageView;
    
    lable = (UILabel *)[cell viewWithTag:10];
    imageView = (UIImageView *)[cell viewWithTag:5];
    
    lable.text = cellString;
    imageView.image = [UIImage imageNamed:@"01.png"];
    
    return cell;
}
#pragma mark - UICollectionViewDelegate Method----------------

@end
