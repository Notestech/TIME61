//
//  TIMEThemeViewController.h
//  TIME61
//
//  Created by zhibincai on 3/3/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseViewController.h"

@interface TIMEThemeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_themes;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
