//
//  UIImage+WebCache.m
//  TIME61
//
//  Created by zhibincai on 11/6/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "UIImage+WebCache.h"

@implementation UIImage (WebCache)



+(UIImage *)imageWithURL:(NSString *)str
{
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    return image;
}
@end
