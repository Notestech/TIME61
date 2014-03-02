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
    
    NSArray *array = [[NSArray alloc]init];
    if ((array= [[NSUserDefaults standardUserDefaults]objectForKey:@"userinfo"])) {
        NSLog(@"%@",array);
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
    
    NSData *received = [WebRequest requestInPOST:urlSting parameters:parameters];
    
    
    NSString *receiveStr = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
    
    NSLog(@"登录:%@",receiveStr);
    
    if ([receiveStr isEqualToString:@"YES"]) {
        
        TIMEMyPageViewController *myPage = [self.storyboard instantiateViewControllerWithIdentifier:@"mypageVC"];
        
        [self.navigationController pushViewController:myPage animated:YES];
        
        //保存用户名和密码
        if (_rememberme.isOn) {
            NSArray *userArray = [NSArray arrayWithObjects:_nameText.text,_pwdText.text, nil];
            [[NSUserDefaults standardUserDefaults]setObject:userArray forKey:@"userinfo"];
        }
    }else{
        _warnText.text = @"用户名或密码错误!";
    }
}


#pragma mark - 注册
- (IBAction)signUpAction:(id)sender {
    TIMERegisterViewController *regvc = [self.storyboard instantiateViewControllerWithIdentifier:@"registerVC"];
    [self.navigationController pushViewController:regvc animated:YES];
}
@end
