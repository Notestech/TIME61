//
//  TIMEHomeViewController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEHomeViewController.h"
#import "NewsayModel.h"
#import "NewsayTableCell.h"
#import "TIMENewsayDetailViewController.h"
#import "WebRequest.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "BaseNavigationController.h"

@interface TIMEHomeViewController ()

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
    [self showGuidePictures];
    [self setupMainView];
    if (!IOS7_OR_LATER) {
        _tableView.frame = CGRectMake(0, 112, ScreenWidth, ScreenHeight-49);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)showGuidePictures
{
    NSArray *array = [WebRequest requestJSON:@"http://time61/api/getwheels.php"];
    NSMutableArray *marray = [[NSMutableArray alloc]initWithCapacity:[array count]];
    for (NSDictionary *dataDic in array) {
        NSString *imageURL = [dataDic objectForKey:@"imageURL"];
        [marray addObject:imageURL];
    }
    
    NSMutableArray *sgItems = [[NSMutableArray alloc]initWithCapacity:marray.count];
    for (int i = 0; i < marray.count; i ++) {
        NSURL *url = [NSURL URLWithString:[marray objectAtIndex:i]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
//        SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
        
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:nil image:image tag:(1000+i)];
        [sgItems addObject:item];
    }
    
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, 112) delegate:self focusImageItemsArrray:sgItems];
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

#pragma mark - load data
-(void)setupMainView
{
    NSArray *dataArray = [WebRequest requestJSON:@"http://time61/api/newsays.php"];
 
    NSMutableArray *newsayArray = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    for (NSDictionary  *newsayDic  in dataArray) {
        
        NewsayModel *newsayModel = [[NewsayModel alloc] initWithDataDic:newsayDic];
        [newsayArray addObject:newsayModel];
        
    }
    self.data = newsayArray;
    [self.tableView reloadData];
  /*
//    NSLog(@"self.data:%@",self.data);
//    UINib *CartonCellNib = [UINib nibWithNibName:@"CartonCell" bundle:nil];
    
//    [self.collectionView registerNib:CartonCellNib forCellWithReuseIdentifier:@"CartonCell"];
    
//    self.tableViewCell.backgroundColor = [UIColor whiteColor];
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    
//    [layout setItemSize:CGSizeMake(320, 160)];
//    
//    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    
//    [self.tableViewCell CollectionViewLayout:layout];
    */
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *newsaycell = @"newsaycell";
    NewsayTableCell *cell = [tableView dequeueReusableCellWithIdentifier:newsaycell];
    
    if (cell == nil) {
        cell = [[NewsayTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:newsaycell];
    }
    NewsayModel *newsayModel = [self.data objectAtIndex:indexPath.row];
    cell.newsayModel = [newsayModel copy];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TIMENewsayDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"newsayDetailVC"];
    
    detail.newsayModel = [self.data objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
    
//    [self performSegueWithIdentifier:@"goNewsayDetail" sender:nil];
}

@end
