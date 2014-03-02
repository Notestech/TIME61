//
//  Commons.h
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @返回物理屏幕大小
 *
 */
CGRect AppBounds();
/**
 * @返回去掉状态栏高度的物理屏幕大小
 *
 */
CGRect AppFrame();

/**
 * @返回指定方向toolBar的高度
 *
 */
//CGFloat ToolbarHeightForOrientation(UIInterfaceOrientation orientation);
CGFloat OriginY();
