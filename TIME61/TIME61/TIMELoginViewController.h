//
//  TIMELoginViewController.h
//  TIME61
//
//  Created by zhibincai on 11/13/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "BaseViewController.h"

@interface TIMELoginViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property(strong,nonatomic)IBOutlet UITextField *nameText;
@property(strong,nonatomic)IBOutlet UITextField *pwdText;
@property(strong,nonatomic)IBOutlet UIButton    *signInButton;
@property(strong,nonatomic)IBOutlet UIButton    *signUpButton;
@property(strong,nonatomic)IBOutlet UILabel    *warnText;
@property (weak, nonatomic) IBOutlet UISwitch *rememberme;


- (IBAction)signInAction:(id)sender;

- (IBAction)signUpAction:(id)sender;

@end
