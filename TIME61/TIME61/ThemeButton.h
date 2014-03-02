//
//  ThemeButton.h
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton


//Normal状态下的图片名称
@property(nonatomic,copy)NSString *imageName;
//高亮状态下的图片名称
@property(nonatomic,copy)NSString *highligtImageName;

//Normal状态下的背景图片名称
@property(nonatomic,copy)NSString *backgroundImageName;
//高亮状态下的背景图片名称
@property(nonatomic,copy)NSString *backgroundHighligtImageName;



- (id)initWithImage:(NSString *)imageName highlighted:(NSString *)highligtImageName;

- (id)initWithBackground:(NSString *)backgroundImageName
   highlightedBackground:(NSString *)backgroundHighligtImageName;

@end
