//
//  ReplayTableCell.m
//  TIME61
//
//  Created by zhibincai on 2/27/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ReplayTableCell.h"
#import "ReplayModel.h"
#import "UIImage+WebCache.h"

#define LIST_FONT 14.0f
#define DETAIL_FONT 18.0f
#define ReplayView_Width (360-60)   //头像左侧视图的宽度


@implementation ReplayTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initView];
    }
    return self;
}

-(void)_initView{
    //头像视图
    _touView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _touView.backgroundColor = [UIColor clearColor];
    _touView.layer.cornerRadius = 30;
    _touView.layer.borderWidth = 1;
    _touView.layer.borderColor = [UIColor blackColor].CGColor;
    _touView.layer.masksToBounds = YES;
    [self.contentView addSubview:_touView];
    
    //用户昵称
    _userLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _userLable.backgroundColor = [UIColor clearColor];
    _userLable.font = [UIFont systemFontOfSize:14.0];
    _userLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_userLable];
    
    //发表时间
    _timeLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _timeLable.backgroundColor = [UIColor clearColor];
    _timeLable.font = [UIFont systemFontOfSize:12.0];
    _userLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_timeLable];
    
    //发表内容
    _sayLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _userLable.textColor = [UIColor blackColor];
    _sayLable.backgroundColor = [UIColor clearColor];
    _sayLable.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:_sayLable];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _touView.frame = CGRectMake(10, 0, 60, 60);
    _touView.image = [UIImage imageWithURL:_replayModel.owner.tou];
    
    _userLable.frame = CGRectMake(90, 5, 100, 20);
    _userLable.text = _replayModel.owner.name;
    
    _timeLable.frame = CGRectMake(190, 5, ReplayView_Width - 100, 20);
    _timeLable.text = _replayModel.time;
    
    _sayLable.frame = CGRectMake(90, 35, ReplayView_Width - 30, 20);
    _sayLable.text = _replayModel.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}
//获取字体高度
+(CGFloat)getFontSize:(BOOL)isDetail
{
    return DETAIL_FONT;
}

//获取TableCell的高度
+(CGFloat)getReplayViewHeight:(ReplayModel *)replayModel
{
    CGFloat height = 0;
    height += 20;
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectZero];
    lable.font = [UIFont systemFontOfSize:[self getFontSize:YES]];
    lable.text = replayModel.content;
    lable.frame = CGRectMake(0, 0, ReplayView_Width - 30, 100);
    CGSize size = [lable getSize];
        
    height += size.height;
    
    
    return height;
}
@end
