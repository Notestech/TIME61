//
//  TIMEHomeViewController.m
//  TIME61
//
//  Created by caizhibin on 13-10-30.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEHomeViewController.h"

@interface TIMEHomeViewController ()
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

-(void)showGuidePictures
{
    SGFocusImageItem *item1 = [[SGFocusImageItem alloc] initWithTitle:@"title1" image:[UIImage imageNamed:@"1.jpg"] tag:1001];
    SGFocusImageItem *item2 = [[SGFocusImageItem alloc] initWithTitle:@"title2" image:[UIImage imageNamed:@"2.jpg"] tag:1002];
    SGFocusImageItem *item3 = [[SGFocusImageItem alloc] initWithTitle:@"title3" image:[UIImage imageNamed:@"3.jpg"] tag:1003];
    
    SGFocusImageFrame *imageFrame = [[SGFocusImageFrame alloc] initWithFrame:[[UIScreen mainScreen] bounds] delegate:self focusImageItems:item1,item2,item3, nil];
    imageFrame.switchTimeInterval = 5.f;
    
    [[[[UIApplication sharedApplication] delegate] window] addSubview:imageFrame];
}
#pragma 实现 SGFocusImageFrameDelegate Action
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    if (item.tag == 1003) {
        [imageFrame removeFromSuperview];
    }
}



@end
