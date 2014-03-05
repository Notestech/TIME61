//
//  MainViewController.h
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TIMEHomeViewController;

@interface MainViewController : UITabBarController
{
    UIView *_tabBarView;
    UIImageView *_sliderView;
}

@property(nonatomic,retain)TIMEHomeViewController *homeVC;

@end
