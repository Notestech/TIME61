//
//  TIMEPaintDetailViewController.m
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEPaintDetailViewController.h"
#import "PaintsModel.h"
#import "UIImageView+WebCache.h"
#import <ShareSDK/ShareSDK.h>
#import "UIFactory.h"
#import "ProgressHUD.h"

@interface TIMEPaintDetailViewController ()

@end

@implementation TIMEPaintDetailViewController

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
//    UIButton *shareButton = [UIFactory createButtonWithBackground:<#(NSString *)#> backgroundHighlighted:<#(NSString *)#>]
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStyleBordered target:self action:@selector(shareAction)];
    self.navigationItem.rightBarButtonItem = item;
	[self loadPictureZoomView];
    
}

-(void)loadPictureZoomView
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(320, 460);
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2;
    _scrollView.bouncesZoom = NO;
    
    [self.view addSubview:_scrollView];
    
    _detailPaintView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [_detailPaintView setImageWithURL:[NSURL URLWithString:_paintsModel.paintsURL]];
    
    
    [_scrollView addSubview:_detailPaintView];
}

#pragma -UIScrollViewDelegate代理方法

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _detailPaintView;
}

    // called before the scroll view begins zooming its content
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view NS_AVAILABLE_IOS(3_2)
{
}
    // scale between minimum and maximum. called after any 'bounce' animations
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
}
    // any zoom scale changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2)
{
    
}


-(void)shareAction
{//[ShareSDK imageWithUrl:_paintsModel.paintsURL]
    id<ISSContent> shareContent = [ShareSDK content:@""
                                     defaultContent:@"此消息来自TIME61"
                                              image:nil
                                              title:_paintsModel.title
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
