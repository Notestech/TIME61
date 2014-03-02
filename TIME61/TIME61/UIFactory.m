//
//  UIFactory.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "UIFactory.h"


@implementation UIFactory

+(ThemeButton *)createButtonWithImage:(NSString *)imageURL highlighted:(NSString *)highlightedURL
{
    return [[ThemeButton alloc]init];
}
+(ThemeImageView *)createImageView:(NSString *)imageName
{
    return [[ThemeImageView alloc]init];
}

//+(UIButton *)createNavigationButton:(CGRect *)frame
//                              title:(NSString *)title
//                             target:(id)target
//                             action:(SEL)action
//{
//    UIButton *btn = [[UIButton alloc]init];
//    return btn;
//}
@end
