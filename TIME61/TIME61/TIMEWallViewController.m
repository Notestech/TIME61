//
//  TIMEWallViewController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEWallViewController.h"
#import "TIMEPaintingViewController.h"

@interface TIMEWallViewController ()

@end

@implementation TIMEWallViewController

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
//    [super viewDidLoad];
    
    self.dataSource = self;
    self.delegate = self;
    
    _array = @[@"最新",@"人气",@"可爱",@"有趣",@"清新"];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - ViewPagerDelegate
//标签个数
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return _array.count;
}
//显示标签
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = [_array objectAtIndex:index];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    
    return label;
}
//返回内容视图
- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index
{
    TIMEPaintingViewController *paintingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"paintingViewController"];
    
    
    return paintingViewController;
}

//定位
-(CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value
{
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 0.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 1.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        case ViewPagerOptionTabHeight:
            return 44.0;
            break;
        case ViewPagerOptionTabOffset:
            return 1.0;
            break;
        case ViewPagerOptionTabWidth:
            return 108.0;
            break;
        case ViewPagerOptionFixFormerTabsPositions:
            return 0.0;
        case ViewPagerOptionFixLatterTabsPositions:
            return 0.0;
        default:
            return value;
    }
}

//颜色
-(UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color
{
    switch (component) {
        case ViewPagerIndicator:
            //            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            return [UIColor blackColor];
            break;
        case ViewPagerTabsView:
            //            return [[UIColor greenColor] colorWithAlphaComponent:0.64];
            return [UIColor whiteColor];
            
        default:
            return color;
    }
}

@end
