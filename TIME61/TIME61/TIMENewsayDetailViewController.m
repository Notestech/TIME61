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
#import "NewsayModel.h"
#import "ReplayModel.h"
#import "WebRequest.h"
#import "NewsayTableCell.h"
#import "HTProgressHUD.h"
#import "ProgressHUD.h"
#import <ShareSDK/ShareSDK.h>
#import "UIFactory.h"

@interface TIMENewsayDetailViewController ()


//@property(nonatomic)NSArray     *newsayData;

@end

@implementation TIMENewsayDetailViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
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
    
	[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(replaySuccessed:) name:@"kReplaySuccessed" object:nil];

    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [shareButton sizeToFit];
    [shareButton addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.titleView = shareButton;
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"评论" style:UIBarButtonItemStyleBordered target:self action:@selector(replay)];
    self.navigationItem.rightBarButtonItem = btn;
    
    [self loadData];
    
}

#pragma mark - load data
-(void)loadData
{
    NSString *str = [NSString stringWithFormat:@"http://time61/api/getreplays.php?sayID=%@",(NSString *)_newsayModel.sayID];
    NSArray *array = [WebRequest requestJSON:str];
    NSMutableArray *mArray = [[NSMutableArray alloc]initWithCapacity:(array.count+1)];
    [mArray addObject:_newsayModel];
    for (NSDictionary *dic in array) {
        ReplayModel *replay = [[ReplayModel alloc]initWithDataDic:dic];
        [mArray addObject:replay];
    }
    self.data = [mArray copy];
    
    [self.tableView reloadData];
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
        NewsayModel *newsayModel = [self.data objectAtIndex:indexPath.row];
        cell.newsayModel = newsayModel;
        
        cell.isReplay = NO;
        return cell;
    }
    ReplayModel *replayModel = [self.data objectAtIndex:indexPath.row];
    cell.replayModel = replayModel;
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



-(void)shareAction
{
    //[ShareSDK imageWithUrl:_paintsModel.paintsURL]
    id<ISSContent> shareContent = [ShareSDK content:_newsayModel.content
                                     defaultContent:@"此消息来自TIME61"
                                              image:nil
                                              title:@""
                                                url:@"http://time61"
                                        description:@""
                                          mediaType:SSPublishContentMediaTypeImage];
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:shareContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess) {
                                    [ProgressHUD showSuccess:@"分享成功"];
                                }
                                if (state == SSResponseStateFail){
                                    [ProgressHUD showError:@"分享失败"];
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

-(void)replay
{
    TIMEReplayViewController *rep = [self.storyboard instantiateViewControllerWithIdentifier:@"replayVC"];
    
    rep.sayID = _newsayModel.sayID;
    
    [self.navigationController pushViewController:rep animated:YES];
}

-(void)replaySuccessed:(NSNotification *)notification
{
    [ProgressHUD showSuccess:@"添加评论成功"];
    //主线程调用
    [self performSelectorOnMainThread:@selector(loadData) withObject:nil waitUntilDone:NO];
}

@end
