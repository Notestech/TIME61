//
//  TIMEPostSayViewController.h
//  TIME61
//
//  Created by zhibincai on 3/5/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseViewController.h"

@interface TIMEPostSayViewController : BaseViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *postTextView;
@property (weak, nonatomic) IBOutlet UIView *toolsBarView;

@end
