//
//  ThemeButton.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"

@implementation ThemeButton

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(id)init{
    self = [super init];
    if (self) {
        //监听主题切换的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeChangedNofication object:nil];
    }
    return self;
}

-(void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

- (id)initWithImage:(NSString *)imageName
        highlighted:(NSString *)highligtImageName{
    self = [self init];
    if (self) {
        self.imageName = imageName;
        self.highligtImageName = highligtImageName;
    }
    return self;
}

- (id)initWithBackground:(NSString *)backgroundImageName
   highlightedBackground:(NSString *)backgroundHighligtImageName{
    self = [self init];
    if (self) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHighligtImageName = backgroundHighligtImageName;
    }
    return self;
}

-(void)loadThemeImage
{
    ThemeManager *themeManger = [ThemeManager shareInstance];
    
    UIImage *imageName = [themeManger getThemeImage:_imageName];
    UIImage *highligtImageName = [themeManger getThemeImage:_highligtImageName];
    [self setImage:imageName forState:UIControlStateNormal];
    [self setImage:highligtImageName forState:UIControlStateHighlighted];
    
    UIImage *backgroundImageName = [themeManger getThemeImage:_backgroundImageName];
    UIImage *backgroundHighligtImageName = [themeManger getThemeImage:_backgroundHighligtImageName];
    [self setBackgroundImage:backgroundImageName forState:UIControlStateNormal];
    [self setBackgroundImage:backgroundHighligtImageName forState:UIControlStateHighlighted];
}

#pragma mark - setter
-(void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}
-(void)setHighligtImageName:(NSString *)highligtImageName
{
    if (_highligtImageName != highligtImageName) {
        _highligtImageName = [highligtImageName copy];
    }
    [self loadThemeImage];
}
-(void)setBackgroundImageName:(NSString *)backgroundImageName
{
    if (_backgroundImageName != backgroundImageName) {
        _backgroundImageName = [backgroundImageName copy];
    }
    [self loadThemeImage];
}
-(void)setBackgroundHighligtImageName:(NSString *)backgroundHighligtImageName
{
    if (_backgroundHighligtImageName != backgroundHighligtImageName) {
        _backgroundHighligtImageName = [backgroundHighligtImageName copy];
    }
    [self loadThemeImage];
}
@end
