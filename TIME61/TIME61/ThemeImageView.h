//
//  ThemeImageView.h
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeImageView : UIImageView

@property(nonatomic)NSString    *imageName;
@property(nonatomic,assign)int  leftCapWidth;
@property(nonatomic,assign)int  topCapHeight;

-(id)initWithImage:(NSString *)imageName;

@end
