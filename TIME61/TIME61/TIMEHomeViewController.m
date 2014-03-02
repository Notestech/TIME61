//
//  TIMEHomeViewController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEHomeViewController.h"
#import "UIImage+WebCache.h"     //添加了imageWithURL方法
#import "NewsayModel.h"
#import "NewsayTableCell.h"
#import "TIMENewsayDetailViewController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)showGuidePictures
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageWithURL:@"http://time61/upload/wheel/wheel_01.png"] tag:1001];
    
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageWithURL:@"http://time61/upload/wheel/wheel_02.png"] tag:1002];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageWithURL:@"http://time61/upload/wheel/wheel_03.png"] tag:1003];
    
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 64 - OriginY(), ScreenWidth, 122) delegate:self focusImageItems:item1,item2,item3, nil];
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
    NSArray *dataArray = [self requestJSON:@"http://time61/api/newsays.php"];
 
    NSMutableArray *newsayArray = [[NSMutableArray alloc] initWithCapacity:dataArray.count];
    for (NSDictionary  *newsayDic  in dataArray) {
        
        NewsayModel *newsayModel = [[NewsayModel alloc] initWithDataDic:newsayDic];
        [newsayArray addObject:newsayModel];
        
    }
    self.data = newsayArray;
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
    cell.newsayModel = newsayModel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TIMENewsayDetailViewController *detail = [[TIMENewsayDetailViewController alloc] init];
    
    TIMENewsayDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"newsayDetailVC"];
    
    detail.newsayModel = [self.data objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
}

//
#pragma mark - load data

-(id)requestJSON:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    if (json == nil) {
        return nil;
    }
    return json;
}

@end
