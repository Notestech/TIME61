//
//  TIMEToysViewController.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEToysViewController.h"
#import "TIMECustomToyCell.h"
#import "WebRequest.h"
#import "ToyModel.h"

@interface TIMEToysViewController ()

@end

@implementation TIMEToysViewController

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
    
    [self _loadData];
}

-(void)_loadData
{
	NSArray *array = [WebRequest requestJSON:@"http://time61/api/toys.php"];
    NSMutableArray *toyArray = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *toyDic in array) {
        ToyModel *toyModel = [[ToyModel alloc] initWithDataDic:toyDic];
        [toyArray addObject:toyModel];
    }
    self.data = toyArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    TIMECustomToyCell *ctCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (ctCell == nil) {
        ctCell = [[TIMECustomToyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    ctCell.toyModel = [self.data objectAtIndex:indexPath.row];
    
    return ctCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
