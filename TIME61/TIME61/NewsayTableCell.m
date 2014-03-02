//
//  NewsayTableCell.m
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//
#import "NewsayTableCell.h"
#import "NewsayModel.h"
#import "ReplayModel.h"
#import "UIImage+WebCache.h"
#import "TIMENewsayDetailViewController.h"

#define LIST_FONT           14.0f
#define DETAIL_FONT         16.0f
#define NEWSAY_WIDTH        (320-60)   //头像视图的宽度

@implementation NewsayTableCell

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
    _touView.layer.cornerRadius = 25;
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
    _sayLable.font = [UIFont systemFontOfSize:LIST_FONT];
    _sayLable.numberOfLines = 100;
    [self.contentView addSubview:_sayLable];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _touView.frame = CGRectMake(5, 0, 50, 50);
    _touView.image = [UIImage imageWithURL:_newsayModel.owner.tou];
    
    _userLable.frame = CGRectMake(70, 5, 130, 20);
    _userLable.text = _newsayModel.owner.name;
    
    
    _sayLable.frame = CGRectMake(70 , 20 + 10, NEWSAY_WIDTH - 15, 20);
    _sayLable.text = _newsayModel.content;
    
    
    if (_isDetail == YES && _isReplay == NO) {
        _sayLable.font = [UIFont systemFontOfSize:DETAIL_FONT];
        CGSize size = [_sayLable getSize];
        _sayLable.frame = CGRectMake(70, 20 + 10, size.width, size.height);
        
        _timeLable.frame = CGRectMake(190, 30 + _sayLable.frame.size.height + 10, NEWSAY_WIDTH - 105 , 10);
        _timeLable.text = _newsayModel.time;
        
    }else if (_isDetail == YES && _isReplay == YES){
        _touView.image = [UIImage imageWithURL:_replayModel.owner.tou];
        
        _userLable.text = _replayModel.owner.name;
        
        _timeLable.text = _replayModel.time;
        
        _sayLable.font = [UIFont systemFontOfSize:DETAIL_FONT];
        _sayLable.text = _replayModel.content;
        
        CGSize size = [_sayLable getSize];
        _sayLable.frame = CGRectMake(70, 20 + 10, size.width, size.height);
        
        
        _timeLable.frame = CGRectMake(190, 30 + _sayLable.frame.size.height + 10, NEWSAY_WIDTH - 105, 10);
        _timeLable.text = _newsayModel.time;
    }else{
        _timeLable.frame = CGRectMake(190, 5, NEWSAY_WIDTH - 105, 20);
        _timeLable.text = _newsayModel.time;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

//获取字体高度
+(CGFloat)getFontSize:(BOOL)isDetail
{
    CGFloat fontSize = 14.0f;
    if (isDetail) {
        return DETAIL_FONT;
    }
    return fontSize;
}

//获取TableCell的高度
+(CGFloat)getNewsayViewHeight:(NewsayModel *)newsayModel
                     isDetail:(BOOL)isDetail
{
    CGFloat height = 50.0f;

    if (isDetail == YES) {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, NEWSAY_WIDTH - 15, 100)];
        lable.font = [UIFont systemFontOfSize:[self getFontSize:YES]];
        lable.text = newsayModel.content;
        
        CGSize size = [lable getSize];

        height += size.height;
        
        height += 10;
    }
    return height;
}
+(CGFloat)getReplayViewHeight:(ReplayModel *)replayModel
{
    CGFloat height = 50.0f;
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, NEWSAY_WIDTH - 15, 100)];
    lable.font = [UIFont systemFontOfSize:[self getFontSize:YES]];
    lable.text = replayModel.content;
    
    CGSize size = [lable getSize];
        
    height += size.height;
    height += 20;
    return height;
}
@end
