//
//  MainViewController.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self _initTabBarViews];
    [self _initViewControllers];
}

-(void)_initTabBarViews
{
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight - OriginY() - 49, ScreenWidth, 49)];
    [self.view addSubview:_tabBarView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbarItem_home"]];
}

-(void)_initViewControllers
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
