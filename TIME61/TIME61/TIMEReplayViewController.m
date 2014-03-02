//
//  TIMEReplayViewController.m
//  TIME61
//
//  Created by zhibincai on 2/23/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEReplayViewController.h"
#import "BaseNavigationController.h"

@interface TIMEReplayViewController ()

@end

@implementation TIMEReplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title =@"发表评论";
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //取消回复按钮
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancleReplay)];
    self.navigationItem.rightBarButtonItem = btn1;
    //确认回复按钮
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmReplay)];
    self.navigationItem.rightBarButtonItem = btn2;
    
    
//    [_relpayTextView awakeFromNib];
    
    [self.view addSubview:_relpayTextView];
    
    [_relpayTextView becomeFirstResponder];
    
}

-(void)cancleReplay
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)confirmReplay
{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"];
    NSString *username = [array objectAtIndex:0];
    
    NSString *replayContent = _relpayTextView.text;
    //http://time61/api/gaveareplay.php?sayID=1&content=see you see me&user=Andy

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://time61/api/gaveareplay.php?sayID=%@&user=%@&content=%@",_sayID,username,replayContent,nil];
        NSURL *url = [[NSURL alloc]initWithString:urlString];
        
        
        });
    
}

-(void)keyboardShowNotification:(NSNotification *)notification
{
    
}

@end
