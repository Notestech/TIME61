//
//  TIMENewsayDetailViewController.h
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class NewsayModel;
@class ReplayModel;

@interface TIMENewsayDetailViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)NewsayModel *newsayModel;
@property(nonatomic)ReplayModel *replayModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic)NSArray     *data;
@end
