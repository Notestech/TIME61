//
//  ThemeManager.h
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThemeChangedNofication @"kThemeChangedNofication"

@interface ThemeManager : NSObject

@property(nonatomic)NSString    *themeName;
@property(nonatomic)NSDictionary    *themePlist;
@property(nonatomic)NSDictionary    *fontColorPlist;

+(ThemeManager *)shareInstance;

-(UIImage *)getImageWithName:(NSString *)imageName;
-(UIColor *)getColorWithName:(NSString *)colorName;

@end
