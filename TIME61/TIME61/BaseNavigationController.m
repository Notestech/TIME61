//
//  BaseNavigationController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManager.h"


@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

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
-(void)themeNotification
{
    [self loadThemeView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeNotification) name:kThemeChangedNofication object:nil];
    [self loadThemeView];
}

-(void)loadThemeView
{
    UIImage *backImage = [[ThemeManager shareInstance]getThemeImage:@"navbar_background.png"];
    [self.navigationBar setBackgroundImage:backImage forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
