//
//  CartonViewCell.m
//  TIME61
//
//  Created by zhibincai on 11/9/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "CartonViewCell.h"
#import "ToyModel.h"
#import "CartonViewCell.h"
#import "UIImage+WebCache.h"

@implementation CartonViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self _initView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
/*
-(void)_initView
{
    _ownerLable= [[UILabel alloc] initWithFrame:CGRectZero];
    
    
    [self.contentView addSubview:_ownerLable];
    
    _paintingView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_paintingView];
    
    _modelView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    [self.contentView addSubview:_modelView];
}

//复写方法,子视图布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _ownerLable.frame = CGRectMake(125, 80, 70, 20);
     NSLog(@"%@",_toyModel.owner);
    _ownerLable.text = _toyModel.owner;
    NSLog(@"%@",_ownerLable.text);
    _paintingView.frame = CGRectMake(2, 2, 120, 160);
    _paintingView.image = [UIImage imageWithURL:_toyModel.paintingURL];
    
    _modelView.frame = CGRectMake(300, 2, 120, 160);
    _modelView.image = [UIImage imageWithURL:_toyModel.modelURL];
}
 */
@end
