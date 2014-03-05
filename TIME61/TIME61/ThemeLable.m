//
//  ThemeLable.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ThemeLable.h"
#import "ThemeManager.h"

@implementation ThemeLable

-(id)initWithColorName:(NSString *)colorName
{
    self = [self init];
    if (self) {
        self.colorName = colorName;
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeNotification:) name:kThemeChangedNofication object:nil];
}

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeNotification:) name:kThemeChangedNofication object:nil];
    }
    return self;
}

#pragma -setter
-(void)setColorName:(NSString *)colorName
{
    if (_colorName != colorName) {
        _colorName = [colorName copy];
    }
    [self setColor];
}

-(void)setColor
{
    if (self.colorName == nil) {
        return;
    }
    
    UIColor *textColor = [[ThemeManager shareInstance]getColorWithName:_colorName];
    self.textColor = textColor;
}

-(void)themeNotification:(NSNotification *)notification
{
    [self setColor];
}

@end
