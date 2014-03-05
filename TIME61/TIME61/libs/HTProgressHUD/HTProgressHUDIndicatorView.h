//
//  HTProgressHUDIndicatorView.h
//  HTProgressHUD
//
//  Created by 최건우 on 13. 6. 30..
//  Copyright (c) 2013년 Hardtack. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    HTProgressHUDIndicatorTypeActivityIndicator,
    HTProgressHUDIndicatorTypePie,
    HTProgressHUDIndicatorTypeRing,
} HTProgressHUDIndicatorType;

@interface HTProgressHUDIndicatorView : UIView

@property (nonatomic) float progress; // 0.0 ~ 1.0

- (id)initWithFrame:(CGRect)frame;
- (id)initWithCustomView:(UIView *)view;

+ (HTProgressHUDIndicatorView *)indicatorViewWithType:(HTProgressHUDIndicatorType)type;

@end
