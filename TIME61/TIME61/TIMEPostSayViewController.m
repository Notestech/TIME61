//
//  TIMEPostSayViewController.m
//  TIME61
//
//  Created by zhibincai on 3/5/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "TIMEPostSayViewController.h"
#import "ProgressHUD.h"
#import "WebRequest.h"
#import "UIFactory.h"

@interface TIMEPostSayViewController ()

@end

@implementation TIMEPostSayViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"发表图画作品";
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	//取消回复按钮
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(canclePost)];
    self.navigationItem.leftBarButtonItem = btn1;
    //确认回复按钮
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStyleBordered target:self action:@selector(confirmPost)];
    self.navigationItem.rightBarButtonItem = btn2;
    
    [self _initToolsBarView];
    
    [_postTextView becomeFirstResponder];
}

-(void)_initToolsBarView
{
    NSArray *images = @[@"compose_locatebutton_background",
                        @"compose_emoticonbutton_background",
                        @"compose_camerabutton_background"];
    NSArray *lightImages = @[@"compose_locatebutton_background_highlighted",
                             @"compose_emoticonbutton_background_highlighted",
                             @"compose_camerabutton_background_highlighted"];
    for (int i=0; i<images.count; i++) {
        UIButton *button = [UIFactory createButton:[images objectAtIndex:i] highlighted:[lightImages objectAtIndex:i]];
        button.frame = CGRectMake(10 + i*23 +i*10, (40-19)/2, 23, 19);
        
        [_toolsBarView addSubview:button];
    }
    _toolsBarView.backgroundColor = [UIColor grayColor];
}

-(void)canclePost
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)confirmPost
{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"];
    NSString *username = [array objectAtIndex:0];
    if (username == nil) {
        [self performSegueWithIdentifier:@"fromPostToLogin" sender:nil];
        
        return;
    }
    
    NSString *postContent = _postTextView.text;
    if ([postContent isEqualToString:@""]) {
        [ProgressHUD showError:@"请添加一些评论内容"];
        return;
    }
    
    //发送数据
    NSString *urlString = @"http://time61/api/postsay.php";
    NSString *parameters = [NSString stringWithFormat:@"user=%@&content=%@",username,postContent];
    
    NSData *data = [WebRequest requestURL:urlString inMethod:@"POST" parameters:parameters];
    NSLog(@"%@",parameters);
    NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"resultString:%@",resultString);
    if (![resultString isEqualToString:@"0"]) {
//        [_postTextView keyboardDismissMode];
        [ProgressHUD showError:@"发表成功"];
        
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }else{
        [ProgressHUD showError:@"发表失败"];
    }
}


-(void)keyboardShowNotification:(NSNotification *)notification
{
    
}
@end
