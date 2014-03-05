//
//  TIMEMyPageViewController.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEMyPageViewController.h"
#import "TIMEMyInfoViewController.h"
#import "TIMEThemeViewController.h"
#import "TIMELoginViewController.h"
#import "UserManager.h"

@interface TIMEMyPageViewController ()

@end

@implementation TIMEMyPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我的主页";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideLoginCell) name:kUserDidLoginNotification object:nil];
    
    self.navigationItem.backBarButtonItem = nil;
    
	NSArray *section1 = @[@"个人信息",@"登录",@"注销"];
    NSArray *section2 = @[@"我的画册",@"发表图画作品",@"订单管理"];
    NSArray *section3 = @[@"主题"];
    self.data = [[NSArray alloc] initWithObjects:section1,section2,section3, nil];
    
}
#pragma mark- UITableViewDataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = [self.data objectAtIndex:section];
    return [sectionArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        //        UIImageView *userTou = [[UIImageView alloc] initWithImage:[UIImage imageWithURL:@""]];
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        
    }
    NSArray *sectionArray = [self.data objectAtIndex:indexPath.section];
    cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"];
            if (array != nil) {
                return 0;
            }
        }else if(indexPath.row == 2){
            NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"];
            if (array == nil) {
                return 0;
            }
        }
    }
    return 44.0f;
}

#pragma mark- UITableViewDelegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //个人信息
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"goMyInfo" sender:nil];
        }
        //登录
        else if (indexPath.row == 1) {
            [self performSegueWithIdentifier:@"fromMypageToLogin" sender:nil];
        }
        //注销
        else if (indexPath.row == 2){
            [[UserManager shareInstance]clearUserInfo];
            [_tableView reloadData];
        }
    }else if (indexPath.section == 1){
        
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"goAlbumVC" sender:nil];
        }else if (indexPath.row == 1){
            [self performSegueWithIdentifier:@"goPostSay" sender:nil];
        }
        
    }else if (indexPath.section == 2){
        
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"goThemeVC" sender:nil];
        }
        
    }
        
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 3) {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

-(void)hideLoginCell
{
    [_tableView reloadData];
}

@end
