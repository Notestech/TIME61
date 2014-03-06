//
//  TIMEReplayViewController.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEReplayViewController.h"
#import "BaseNavigationController.h"
#import "WebRequest.h"
#import "TIMELoginViewController.h"
#import "HTProgressHUD.h"
#import "ProgressHUD.h"
#import "UIFactory.h"

@interface TIMEReplayViewController ()

@end

@implementation TIMEReplayViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title =@"发表评论";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    //取消回复按钮
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancleReplay)];
    self.navigationItem.leftBarButtonItem = btn1;
    //确认回复按钮
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmReplay)];
    self.navigationItem.rightBarButtonItem = btn2;
    

    
    [self _initToolsBarView];
    [_relpayTextView becomeFirstResponder];
    
}

-(void)_initToolsBarView
{
    NSArray *images = @[@"compose_locatebutton_background.png",
                        @"compose_emoticonbutton_background.png",
                        @"compose_camerabutton_background.png"];
    NSArray *lightImages = @[@"compose_locatebutton_background_highlighted.png",
                             @"compose_emoticonbutton_background_highlighted.png",
                             @"compose_camerabutton_background_highlighted.png"];
    for (int i=0; i<images.count; i++) {
        UIButton *button = [UIFactory createButton:[images objectAtIndex:i] highlighted:[lightImages objectAtIndex:i]];
        button.frame = CGRectMake(10 + i*23 +i*40, (40-19)/2, 23, 19);
        button.tag = 1100+i;
        [button targetForAction:@selector(toolAction:) withSender:button];
        [_toolsBarView addSubview:button];
    }
    _toolsBarView.backgroundColor = [UIColor grayColor];
}

-(void)toolAction:(UIButton *)sender
{
    if (sender.tag == 1100) {
        
    }else if (sender.tag == 1101){
    
    }else if (sender.tag == 1102){
    
    }else if (sender.tag == 1103){
        
    }
}

-(void)cancleReplay
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)confirmReplay
{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"];
    NSString *username = [array objectAtIndex:0];
    if (username == nil) {
        [self performSegueWithIdentifier:@"goToLogin" sender:nil];
        
        return;
    }
    
    NSString *replayContent = _relpayTextView.text;
    if ([replayContent isEqualToString:@""]) {
        [ProgressHUD showError:@"请添加一些评论内容"];
        return;
    }
    //http://time61/api/gaveareplay.php?sayID=1&content=see you see me&user=Andy

    //发送数据
    NSString *urlString = @"http://time61/api/gaveareplay.php";
    NSString *parameters = [NSString stringWithFormat:@"sayID=%@&user=%@&content=%@",_sayID,username,replayContent];
    
    NSData *data = [WebRequest requestURL:urlString inMethod:@"POST" parameters:parameters];
    
    NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if (![resultString isEqualToString:@"0"]) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"kReplaySuccessed" object:resultString];
        
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }else{
        [ProgressHUD showError:@"添加评论失败"];
    }
    
    

}

-(void)keyboardShowNotification:(NSNotification *)notification
{
    
}

@end
