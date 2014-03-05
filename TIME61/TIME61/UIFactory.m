//
//  UIFactory.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "UIFactory.h"


@implementation UIFactory

//创建 ThemeButton
+(ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightedName
{
    return [[ThemeButton alloc]initWithImage:imageName highlighted:highlightedName];
}

+(ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName backgroundHighlighted:(NSString *)backgroundHighlightedName
{
    return [[ThemeButton alloc]initWithBackground:backgroundImageName highlightedBackground:backgroundHighlightedName];
}

//创建 ThemeImageView
+(ThemeImageView *)createImageView:(NSString *)imageName
{
    return [[ThemeImageView alloc]initWithImage:imageName];
}

//创建 ThemeLable
+(ThemeLable *)createLable:(NSString *)colorName
{
    return [[ThemeLable alloc]initWithColorName:colorName];
}

@end
