//
//  HTProgressHUDFadeAnimation.m
//  HTProgressHUD
//
//  Created by 최건우 on 13. 6. 30..
//  Copyright (c) 2013년 Hardtack. All rights reserved.
//

#import "HTProgressHUDFadeAnimation.h"

@implementation HTProgressHUDFadeAnimation

#pragma mark - Class methods

+ (HTProgressHUDFadeAnimation *)animation {
    return [[[self class] alloc] init];
}

#pragma mark - Initializers

- (id)init {
    self = [super init];
    if (self) {
        self.duration = 0.3;
        self.curve = UIViewAnimationCurveEaseInOut;
    }
    return self;
}

#pragma mark - Public methods

#pragma mark - Overrides

#pragma mark HTProgressHUDAnimation overrides

#pragma mark  Showing animation

- (void)setUpShowingAnimation:(HTProgressHUD *)progressHUD {
    progressHUD.alpha = 0;
}

- (void)performShowingAnimation:(HTProgressHUD *)progressHUD {
    [UIView setAnimationCurve:self.curve];
    [UIView animateWithDuration:self.duration
                     animations:^{
                         progressHUD.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         [self finishAnimation];
                     }];
}

- (void)tearDownShowingAnimation:(HTProgressHUD *)progressHUD {
}

#pragma mark  Hiding animation

- (void)setUpHidingAnimation:(HTProgressHUD *)progressHUD {
}

- (void)performHidingAnimation:(HTProgressHUD *)progressHUD {
    [UIView setAnimationCurve:self.curve];
    [UIView animateWithDuration:self.duration
                     animations:^{
                         progressHUD.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [self finishAnimation];
                     }];
}

- (void)tearDownHidingAnimation:(HTProgressHUD *)progressHUD {
    
}

@end
