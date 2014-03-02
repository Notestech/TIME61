//
//  ThemeManager.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *singleton = nil;

@implementation ThemeManager

+(ThemeManager *)shareInstance
{
    if (singleton == nil) {
        @synchronized(self){
            singleton = [[ThemeManager alloc]init];
        }
    }
    return singleton;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *themePlistPath = [[NSBundle mainBundle]pathForResource:@"Theme" ofType:@"plist"];
        self.themePlist = [NSDictionary dictionaryWithContentsOfFile:themePlistPath];
        
        self.themeName = nil;
    }
    return self;
}

-(void)setThemeName:(NSString *)themeName
{
    if (_themeName != themeName) {
        _themeName = themeName;
    }
    
    NSString *themePath = [self getThemePath];
    NSString *filePath = [themePath stringByAppendingPathComponent:@"fontColor.plist"];
    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:filePath];
}

//获取主题目录路径
-(NSString *)getThemePath
{
    NSString *resourcePath = [[NSBundle mainBundle]resourcePath];
    if (self.themeName == nil) {
        return  resourcePath;
    }
    
    NSString *currentTheme = [self.themePlist objectForKey:_themeName];
    NSString *themePath = [resourcePath stringByAppendingPathComponent:currentTheme];
    
    return themePath;
}

//获取当前主题下 图片名对应的 UIImage
-(UIImage *)getImageWithName:(NSString *)imageName
{
    if (imageName == nil) {
        nil;
    }
    
    NSString *themePath = [self getThemePath];
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

//获取当前主题下 颜色名对应的 UIColor
-(UIColor *)getColorWithName:(NSString *)colorName
{
    if (colorName == nil) {
        return nil;
    }
    
    NSString *rgb = [_fontColorPlist objectForKey:colorName];
    NSArray  *rgbs = [rgb componentsSeparatedByString:@","];
    
    if (rgbs.count == 3) {
        float r = [rgbs[0] floatValue];
        float g = [rgbs[1] floatValue];
        float b = [rgbs[2] floatValue];
        UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        return color;
    }
    return nil;
}

@end
