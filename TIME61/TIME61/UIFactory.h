//
//  UIFactory.h
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeButton.h"
#import "ThemeLable.h"
#import "ThemeImageView.h"

@interface UIFactory : NSObject

//创建 ThemeButton
+(ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightedName;
+(ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName backgroundHighlighted:(NSString *)backgroundHighlightedName;

//创建 ThemeImageView
+(ThemeImageView *)createImageView:(NSString *)imageName;

//创建 ThemeLable
+(ThemeLable *)createLable:(NSString *)colorName;


@end
