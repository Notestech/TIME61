//
//  TIMERegisterViewController.m
//  TIME61
//
//  Created by zhibincai on 3/2/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMERegisterViewController.h"
#import "WebRequest.h"
#import "ProgressHUD.h"

@interface TIMERegisterViewController ()

@end

@implementation TIMERegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"注册";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.containerView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
	[_pwdText setSecureTextEntry:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerAction:(id)sender {
    NSString *url = @"http://time61/user/signup.php";
    NSString *parameters= [NSString stringWithFormat:@"name=%@&pwd=%@",_nicknameText.text,_pwdText.text];
    NSData *result = [WebRequest requestURL:url inMethod:@"POST" parameters:parameters];
    NSString *resultString = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
    if (resultString != 0) {
        [ProgressHUD showSuccess:@"注册成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [ProgressHUD showError:@"注册失败"];
    }
}
@end
