//
//  TIMENewsayDetailViewController.m
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMENewsayDetailViewController.h"
#import "TIMEReplayViewController.h"
#import "BaseNavigationController.h"
#import "ReplayTableCell.h"
#import "UIImage+WebCache.h"
#import "NewsayModel.h"
#import "ReplayModel.h"
#import "WebRequest.h"
#import "NewsayTableCell.h"

@interface TIMENewsayDetailViewController ()


//@property(nonatomic)NSArray     *newsayData;

@end

@implementation TIMENewsayDetailViewController

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
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStyleBordered target:self action:@selector(replay)];
    self.navigationItem.rightBarButtonItem = btn;
    
    [self loadData];
	
}

-(void)loadData
{
    NSString *str = [NSString stringWithFormat:@"http://time61/api/getreplays.php?sayID=%@",(NSString *)_newsayModel.sayID];
    NSArray *array = [WebRequest requestJSON:str];
    NSMutableArray *mArray = [[NSMutableArray alloc]initWithCapacity:array.count+1];
    [mArray addObject:_newsayModel];
    for (NSDictionary *dic in array) {
        ReplayModel *replay = [[ReplayModel alloc]initWithDataDic:dic];
        [mArray addObject:replay];
    }
    self.data = mArray;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    NewsayTableCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NewsayTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.isDetail = YES;
    //详细内容
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.newsayModel = [self.data objectAtIndex:indexPath.row];
        
        cell.isReplay = NO;
        return cell;
    }
    
    cell.replayModel = [self.data objectAtIndex:indexPath.row];
    cell.isReplay = YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    
    height = [NewsayTableCell getReplayViewHeight:[self.data objectAtIndex:indexPath.row]];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        height = [NewsayTableCell getNewsayViewHeight:[self.data objectAtIndex:indexPath.row] isDetail:YES];
    }
    return height;
    
}

-(void)replay
{
    TIMEReplayViewController *rep = [self.storyboard instantiateViewControllerWithIdentifier:@"replayVC"];
//    [self.navigationController presentViewController:rep animated:YES completion:nil];
    
    rep.sayID = _newsayModel.sayID;
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:rep];
    [self presentViewController:nav animated:YES completion:NULL];
}
@end
