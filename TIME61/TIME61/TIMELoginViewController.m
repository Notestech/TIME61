//
//  TIMELoginViewController.m
//  TIME61
//
//  Created by zhibincai on 11/13/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "TIMELoginViewController.h"
#import "TIMEMyPageViewController.h"
#import "TIMERegisterViewController.h"
#import "WebRequest.h"
#import "UserManager.h"

@interface TIMELoginViewController ()

@end

@implementation TIMELoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"登录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    
    [_pwdText setSecureTextEntry:YES];
    NSArray *array = [[NSArray alloc]init];
    if ((array= [[NSUserDefaults standardUserDefaults]objectForKey:@"userinfo"])) {
        _nameText.text = [array objectAtIndex:0];
        _pwdText.text = [array objectAtIndex:1];
    }
    
    
}

#pragma mark - 登录

- (IBAction)signInAction:(id)sender {
    //提交地址
    NSString *urlSting = @"http://time61/user/signin.php";
    //设置请求参数
    NSString *parameters = [NSString stringWithFormat:@"name=%@&pwd=%@",_nameText.text,_pwdText.text];
    /*
    NSURL *url = [[NSURL alloc] initWithString:@"http://time61/user/signin.php"];
    //创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];//设置请求方式为POST,默认为GET
    NSData *data = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    //链接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    */
    NSData *received = [WebRequest requestURL:urlSting inMethod:@"POST" parameters:parameters];

    NSString *receiveStr = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    
    
    if ([receiveStr isEqualToString:@"YES"]) {
        //保存用户名和密码
        UserManager *userManager = [UserManager shareInstance];
        [userManager setUserName:_nameText.text];
        [userManager setUserPassword:_pwdText.text];
        
        if (_rememberme.isOn) {
            
            [userManager setIsRememberMe:YES];
        }
        [[NSNotificationCenter defaultCenter]postNotificationName:kUserDidLoginNotification object:nil];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        _warnText.text = @"用户名或密码错误!";
    }
}


#pragma mark - go注册
- (IBAction)signUpAction:(id)sender {
    
    [self performSegueWithIdentifier:@"goRegister" sender:nil];
}
@end
