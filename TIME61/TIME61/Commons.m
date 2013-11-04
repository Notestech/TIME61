//
//  Commons.m
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "Commons.h"

CGRect AppBounds()
{
    return [UIScreen mainScreen].bounds;
}

CGRect AppFrame()
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    return CGRectMake(0, 0, frame.size.width, frame.size.height);
}
