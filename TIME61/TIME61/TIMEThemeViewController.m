//
//  TIMEThemeViewController.m
//  TIME61
//
//  Created by zhibincai on 3/3/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEThemeViewController.h"
#import "ThemeManager.h"

@interface TIMEThemeViewController ()

@end

@implementation TIMEThemeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"主题设置";
//        NSDictionary *themeDic
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _themes = [[ThemeManager shareInstance].themePlist allKeys];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_themes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
    NSString *text = [_themes objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    
    NSString *themeName = [ThemeManager shareInstance].themeName;
    if (themeName == nil) {
        themeName = @"default";
    }
    
    if ([themeName isEqualToString:text]) {
        cell.accessoryType  = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *themeName = [_themes objectAtIndex:indexPath.row];
    if ([themeName isEqualToString:@"default"]) {
        themeName = nil;
    }
    [ThemeManager shareInstance].themeName = themeName;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:kThemeChangedNofication object:themeName];
    
    [[NSUserDefaults standardUserDefaults]setObject:themeName forKey:@"themename"];
    
    [_tableView reloadData];
}

@end
