//
//  TIMEPaintDetailViewController.m
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEPaintDetailViewController.h"
#import "UIImage+WebCache.h"
#import "PaintsModel.h"

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
    
	
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(320, 460);
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2;
    _scrollView.bouncesZoom = NO;
    
    [self.view addSubview:_scrollView];
    
    _detailPaintView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    _detailPaintView.image = [UIImage imageWithURL:self.paintsModel.paintsURL];
    
    
    [_scrollView addSubview:_detailPaintView];
}

    // return a view that will be scaled. if delegate returns nil, nothing happens
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
