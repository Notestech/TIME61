//
//  TIMECustomToyCell.m
//  TIME61
//
//  Created by zhibincai on 2/20/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMECustomToyCell.h"
#import "ToyModel.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageDownloader.h"

@implementation TIMECustomToyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initView];
    }
    return self;
}
-(void)_initView
{
    //绘画视图
    _paintsView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _paintsView.backgroundColor = [UIColor clearColor];
    _paintsView.layer.borderColor = [UIColor blackColor].CGColor;
    _paintsView.layer.borderWidth = 1;
    _paintsView.layer.masksToBounds = YES;
    [self.contentView addSubview:_paintsView];
    
    //作者
    _ownerLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _ownerLable.backgroundColor = [UIColor clearColor];
    _ownerLable.font = [UIFont systemFontOfSize:12.0];
    _ownerLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_ownerLable];
    
    //玩具视图
    _toyView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _toyView.backgroundColor = [UIColor clearColor];
    _toyView.layer.borderColor = [UIColor blackColor].CGColor;
    _toyView.layer.borderWidth = 1;
    _toyView.layer.masksToBounds = YES;
    [self.contentView addSubview:_toyView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //绘画视图
    _paintsView.frame = CGRectMake(0, 0, 140, 240);
    [_paintsView setImageWithURL:[NSURL URLWithString:_toyModel.paintURL]];
    
    //作者
    _ownerLable.frame = CGRectMake(140, 70, 40, 20);
    _ownerLable.text = _toyModel.owner;
    
    //玩具视图
    _toyView.frame = CGRectMake(180, 0, 140, 240);
    [_toyView setImageWithURL:[NSURL URLWithString:_toyModel.toyURL]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
