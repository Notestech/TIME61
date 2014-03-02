//
//  TIMEMyPageViewController.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEMyPageViewController.h"

@interface TIMEMyPageViewController ()

@end

@implementation TIMEMyPageViewController

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
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]init];
    leftItem.title = @"";
    self.navigationItem.leftBarButtonItem = leftItem;
    
	NSArray *section1 = @[@"个人信息",@"好友列表",@"注销"];
    NSArray *section2 = @[@"我的画册",@"发表作品"];
    self.data = [[NSArray alloc] initWithObjects:section1,section2, nil];
    
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        //        UIImageView *userTou = [[UIImageView alloc] initWithImage:[UIImage imageWithURL:@""]];
    }
    NSArray *sectionArray = [self.data objectAtIndex:indexPath.section];
    cell.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark- UITableViewDelegate Method
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end
