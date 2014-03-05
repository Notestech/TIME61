//
//  HTProgressHUDAnimation.m
//  HTProgressHUD
//
//  Created by 최건우 on 13. 6. 30..
//  Copyright (c) 2013년 Hardtack. All rights reserved.
//

#import "HTProgressHUDAnimation.h"

@interface HTProgressHUD (AnimationCallBack)

- (void)animationDidFinishWithType:(HTProgressHUDAnimationType)animationType;

@end

@implementation HTProgressHUDAnimation

#pragma mark - Public methods

- (void)setUpShowingAnimation:(HTProgressHUD *)progressHUD {
}

- (void)performShowingAnimation:(HTProgressHUD *)progressHUD {
    
}

- (void)tearDownShowingAnimation:(HTProgressHUD *)progressHUD {
    
}

- (void)setUpHidingAnimation:(HTProgressHUD *)progressHUD {
    
}

- (void)performHidingAnimation:(HTProgressHUD *)progressHUD {
    
}

- (void)tearDownHidingAnimation:(HTProgressHUD *)progressHUD {
    
}

- (void)finishAnimation {
    [self.performingHUD animationDidFinishWithType:self.animationType];
    self.performingHUD = nil;
}

@end
