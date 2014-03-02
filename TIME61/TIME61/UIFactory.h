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

//创建ThemeButton
+(ThemeButton *)createButtonWithImage:(NSString *)imageName highlighted:(NSString *)highlightedName;

+(ThemeImageView *)createImageView:(NSString *)imageName;

//+(ThemeLable *)createLable:()
//+(UIButton *)createNavigationButton:(CGRect *)frame
//                              title:(NSString *)title
//                             target:(id)target
//                             action:(SEL)action;
@end
