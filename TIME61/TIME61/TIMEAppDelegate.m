//
//  TIMEAppDelegate.m
//  TIME61
//
//  Created by caizhibin on 13-10-30.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "TIMEAppDelegate.h"
#import "ThemeManager.h"
#import "UserManager.h"
#import <ShareSDK/ShareSDK.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"

@implementation TIMEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setTheme];
    [self setShareSDK];
    [self setUserManager];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
//程序退出前
- (void)applicationWillTerminate:(UIApplication *)application
{
    [self terminateUserManager];
}

//---------------------------------------------------------------------------------------
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url wxDelegate:self];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url sourceApplication:sourceApplication annotation:annotation wxDelegate:self];
}



//应用主题设置
-(void)setTheme
{
    NSString *themeName = [[NSUserDefaults standardUserDefaults]objectForKey:@"themename"];
    [[ThemeManager shareInstance]setThemeName:themeName];
}

//设置ShareSDK
-(void)setShareSDK
{
    [ShareSDK registerApp:@"1466b16c5b0c"];
    
    
    //添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"936262827"
                               appSecret:@"bdbc81a30ba105972c5739f6ab74ee91"
                             redirectUri:@"http://time61.sinaapp.com/index.html"];
    
    //QQ好友平台
    [ShareSDK connectQQWithQZoneAppKey:@"101031902"
                     qqApiInterfaceCls:[QQApiInterface class]
                       tencentOAuthCls:[TencentOAuth class]];
    
     /****
     //添加腾讯微博应用
     [ShareSDK connectTencentWeiboWithAppKey:@""
                                    appSecret:@""
                                    redirectUri:@""];

     //添加QQ空间应用
     [ShareSDK connectQZoneWithAppKey:@"100371282"
     appSecret:@"aed9b0303e3ed1e27bae87c33761161d"];
    
    
     //添加网易微博应用
     [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
     appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
     redirectUri:@"http://www.shareSDK.cn"];
     
     //添加搜狐微博应用
     [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
     consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
     redirectUri:@"http://www.sharesdk.cn"];
     ****/
}

//应用用户管理
-(void)setUserManager
{
    NSArray *userInfo = [[NSUserDefaults standardUserDefaults]objectForKey:@"userinfo"];
    NSString *userName = [userInfo objectAtIndex:0];
    NSString *userPassword = [userInfo objectAtIndex:1];
    UserManager *userManager = [UserManager shareInstance];
    [userManager setUserName:userName];
    [userManager setUserPassword:userPassword];
}

-(void)terminateUserManager
{
    UserManager *userManager = [UserManager shareInstance];
    if (!userManager.isRememberMe) {
        [userManager clearUserInfo];
    }
}

@end
