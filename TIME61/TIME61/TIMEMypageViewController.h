//
//  TIMEMyPageViewController.h
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseViewController.h"

@interface TIMEMyPageViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *data;
@end
