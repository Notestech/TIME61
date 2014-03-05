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

@property(nonatomic,retain)NSString    *themeName;
@property(nonatomic,retain)NSDictionary    *themePlist;
@property(nonatomic,retain)NSDictionary    *fontColorPlist;

+(ThemeManager *)shareInstance;

-(UIImage *)getThemeImage:(NSString *)imageName;
-(UIColor *)getColorWithName:(NSString *)colorName;

@end
