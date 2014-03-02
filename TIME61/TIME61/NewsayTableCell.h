//
//  NewsayTableCell.h
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+Ext.h"

@class NewsayModel;
@class ReplayModel;

@interface NewsayTableCell : UITableViewCell
{
    UIImageView *_touView;
    UILabel *_userLable;
    UILabel *_timeLable;
    UILabel *_sayLable;
    
}

@property(nonatomic)NewsayModel *newsayModel;
@property(nonatomic)ReplayModel *replayModel;
//是否显示在详情页面
@property(nonatomic)BOOL isDetail;
//是否是恢复视图
@property(nonatomic)BOOL isReplay;
//获取字体高度
+(CGFloat)getFontSize:(BOOL)isDetail;
//获取TableCell的高度
+(CGFloat)getNewsayViewHeight:(NewsayModel *)newsayModel isDetail:(BOOL)isDetail;
+(CGFloat)getReplayViewHeight:(ReplayModel *)replayModel;
@end
