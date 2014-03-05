//
//  TIMEReplayViewController.h
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseViewController.h"

@interface TIMEReplayViewController : BaseViewController<UITextViewDelegate>


@property(nonatomic)NSString *sayID;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextView *relpayTextView;
@property (weak, nonatomic) IBOutlet UIView *toolsBarView;

@end
