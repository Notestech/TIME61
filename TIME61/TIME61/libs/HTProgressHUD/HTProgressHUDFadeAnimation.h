//
//  HTProgressHUDFadeAnimation.h
//  HTProgressHUD
//
//  Created by 최건우 on 13. 6. 30..
//  Copyright (c) 2013년 Hardtack. All rights reserved.
//

#import "HTProgressHUDAnimation.h"

@interface HTProgressHUDFadeAnimation : HTProgressHUDAnimation

@property (nonatomic) NSTimeInterval duration; // Default is 0.3
@property (nonatomic) UIViewAnimationCurve curve; // Default is UIViewAnimationCurveEaseInOut

+ (HTProgressHUDFadeAnimation *)animation;

@end
