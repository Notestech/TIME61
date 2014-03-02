//
//  ThemeImageView.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ThemeImageView.h"

@implementation ThemeImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageName = _imageName;
    }
    return self;
}

-(id)initWithImage:(NSString *)imageName
{
    
}

@end
