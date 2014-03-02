//
//  UIImage+WebCache.m
//  TIME61
//
//  Created by zhibincai on 11/6/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "UIImage+WebCache.h"

@implementation UIImage (WebCache)

/*
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
 
 NSLog(@"Starting: %@", urlString);
 UIImage *avatarImage = nil;
 NSURL *url = [NSURL URLWithString:urlString];
 NSData *responseData = [NSData dataWithContentsOfURL:url];
 avatarImage = [UIImage imageWithData:responseData];
 NSLog(@"Finishing: %@", urlString);
 
 if (avatarImage) {
 dispatch_async(dispatch_get_main_queue(), ^{
 self.image = avatarImage;
 });
 dispatch_async(dispatch_get_main_queue(), completion);
 }
 else {
 NSLog(@"-- impossible download: %@", urlString);
 }
 });
 */

+(UIImage *)imageWithURL:(NSString *)str
{
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    return image;
}
@end
