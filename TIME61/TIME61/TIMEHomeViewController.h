//
//  TIMEHomeViewController.h
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "BaseViewController.h"
#import "SGFocusImageFrame.h"

@class NewsayModel;

@interface TIMEHomeViewController : BaseViewController<SGFocusImageFrameDelegate,UITableViewDelegate,UITableViewDataSource>



@property(strong,nonatomic)IBOutlet UITableView *tableView;
@property(nonatomic)NSArray *data;

@end
