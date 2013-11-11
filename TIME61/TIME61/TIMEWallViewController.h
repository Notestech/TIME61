//
//  TIMEWallViewController.h
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewPagerController.h"

@interface TIMEWallViewController : ViewPagerController<ViewPagerDataSource,ViewPagerDelegate>{
@private
    NSArray *_array;
}


@end
