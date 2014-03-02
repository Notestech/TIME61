//
//  ThemeButton.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ThemeButton.h"

@implementation ThemeButton

-(id)init{
    self = [self init];
    if (self) {
        //监听主题切换的通知
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
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



@end
