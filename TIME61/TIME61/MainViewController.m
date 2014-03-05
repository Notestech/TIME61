//
//  MainViewController.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "TIMEHomeViewController.h"
#import "TIMEWallViewController.h"
#import "TIMESpiritsViewController.h"
#import "TIMEToysViewController.h"
#import "TIMEMyPageViewController.h"
#import "UIFactory.h"
#import "ThemeManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void)dealloc
{
    _tabBarView = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setHidden:YES];
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadThemeImage) name:kThemeChangedNofication object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self _initTabBarViews];
    [self _initViewControllers];
}

-(void)_initViewControllers
{
    _homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"homeVC"];
    TIMEWallViewController *wallVC = [self.storyboard instantiateViewControllerWithIdentifier:@"wallVC"];
    TIMESpiritsViewController *spiritsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"spiritsVC"];
    TIMEToysViewController *toysVC = [self.storyboard instantiateViewControllerWithIdentifier:@"toysVC"];
    TIMEMyPageViewController *mypageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mypageVC"];
    
    NSArray *vcArray = @[_homeVC,wallVC,spiritsVC,toysVC,mypageVC];
    NSMutableArray *ncArray = [[NSMutableArray alloc]initWithCapacity:vcArray.count];
    for (UIViewController *vc in vcArray) {
        BaseNavigationController *baseNC = [[BaseNavigationController alloc]initWithRootViewController:vc];
        [ncArray addObject:baseNC];
    }
    
    self.viewControllers = ncArray;
}

-(void)_initTabBarViews
{
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 49, ScreenWidth, 49)];
    [self.view addSubview:_tabBarView];
    
//    UIImage *image = [[ThemeManager shareInstance]getThemeImage:@"tabbar_background.png"];
//    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:image];
    UIImageView *imageView = [UIFactory createImageView:@"tabbar_background.png"];
    imageView.frame = _tabBarView.bounds;
    [_tabBarView addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    
    NSArray *backImageArray = @[@"tabbarItem_home.png",
                                 @"tabbarItem_wall.png",
                                 @"tabbarItem_spirits.png",
                                 @"tabbarItem_toys.png",
                                 @"tabbarItem_mypage.png"];
    NSArray *lightImageArray = @[@"tabbarItem_home.png",
                                 @"tabbarItem_wall.png",
                                 @"tabbarItem_spirits.png",
                                 @"tabbarItem_toys.png",
                                 @"tabbarItem_mypage.png"];
    for (int i = 0; i < backImageArray.count; i ++) {
        NSString *backImage = backImageArray[i];
        NSString *lightImage = lightImageArray[i];
        
        UIButton *button = [UIFactory createButtonWithBackground:backImage backgroundHighlighted:lightImage];
        
        button.frame = CGRectMake((64-30)/2 + i*64, (49-30)/2, 30, 30);
        button.tag = i;
        
        [button addTarget:self action:@selector(clickedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:button];
        
//        _sliderView = [UIFactory createImageView:@"tabbar_slider.png"];
//        _sliderView.backgroundColor = [UIColor clearColor];
//        _sliderView.frame = CGRectMake((64-15)/2, 5, 15, 44);
//        [_tabBarView addSubview:_sliderView];
    }
}

-(void)clickedTab:(UIButton *)button
{
    self.selectedIndex = button.tag;
//    float x = button.left + (button.width - _sliderView.width)/2;
//    [UIView animateWithDuration:0.2 animations:^{
//        _sliderView.left += x;
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
