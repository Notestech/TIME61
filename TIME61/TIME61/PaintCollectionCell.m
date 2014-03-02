//
//  PaintCollectionCell.m
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "PaintCollectionCell.h"
#import "PaintsModel.h"
#import "UIImage+WebCache.h"
#import "UIViewExt.h"

@implementation PaintCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
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
    
    //分享,收藏,喜欢
    _barLable = [[UILabel alloc] initWithFrame:CGRectZero];
    _barLable.backgroundColor = [UIColor clearColor];
    _barLable.font = [UIFont systemFontOfSize:12.0];
    _barLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:_barLable];
}

-(void)layoutSubviews
{
    //绘画视图
    _paintsView.frame = CGRectMake(0, 0, 100, 160);
    _paintsView.image = [UIImage imageWithURL:_paintsModel.paintsURL];
    
    //作者
    _ownerLable.frame = CGRectMake(0, 160, 100, 28);
    _ownerLable.text = _paintsModel.owner;
    
    //分享,收藏,喜欢
    _barLable.frame = CGRectMake(0, 178, 100, 28);
    NSString *lableString = [NSString stringWithFormat:@"分享:%@ 喜欢:%@ 喜欢:%@",[_paintsModel share] ,[_paintsModel love],[_paintsModel comment]];
    _barLable.text = lableString;
}

@end
