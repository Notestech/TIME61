//
//  ThemeImageView.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManager.h"

@implementation ThemeImageView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeNotification:) name:kThemeChangedNofication object:nil];
}

-(id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeNotification:) name:kThemeChangedNofication object:nil];
    }
    return self;
}

-(id)initWithImage:(NSString *)imageName
{
    self = [self init];
    if (self != nil) {
        self.imageName = imageName;
    }
    return self;
}

#pragma -setter
-(void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

//加载当前主题下对应的图片
-(void)loadThemeImage
{
    if (self.imageName == nil) {
        return;
    }
    UIImage *image = [[ThemeManager shareInstance]getThemeImage:_imageName];
    image = [image stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    self.image = image;
}

//切换主题通知
-(void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}


@end
