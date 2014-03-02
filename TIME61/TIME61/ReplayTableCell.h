//
//  ReplayTableCell.h
//  TIME61
//
//  Created by zhibincai on 2/27/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+Ext.h"

@class ReplayModel;

@interface ReplayTableCell : UITableViewCell
{
    UIImageView *_touView;
    UILabel *_userLable;
    UILabel *_timeLable;
    UILabel *_sayLable;
}

@property(nonatomic)ReplayModel *replayModel;

//获取字体高度
+(CGFloat)getFontSize:(BOOL)isDetail;
//获取TableCell的高度
+(CGFloat)getReplayViewHeight:(ReplayModel *)replayModel;

@end
