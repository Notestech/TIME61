//
//  UserManager.m
//  TIME61
//
//  Created by zhibincai on 3/4/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "UserManager.h"

static UserManager *singleton = nil;

@implementation UserManager

+(UserManager *)shareInstance
{
    if (singleton == nil) {
        @synchronized(self){
            singleton = [[UserManager alloc]init];
        }
    }
    return singleton;
}

-(id)init
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"UserManager" ofType:@"plist"];
        self.userManagerPlist = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return self;
}


#pragma - setter
-(void)setUserName:(NSString *)userName
{
    if (_userName != userName) {
        _userName = userName;
    }
    
    [self updateUserInfo];
}

-(void)setUserPassword:(NSString *)userPassword
{
    if (_userPassword != userPassword) {
        _userPassword = userPassword;
    }
    [self updateUserInfo];
}

-(void)setIsRememberMe:(BOOL)isRememberMe
{
    if (_isRememberMe != isRememberMe) {
        _isRememberMe = isRememberMe;
    }
    [self updateUserInfo];
}

-(void)updateUserInfo
{
    if (!(_userName == nil || _userPassword == nil)) {
        NSArray *userInfo = [NSArray arrayWithObjects:_userName,_userPassword, nil];
        
        [[NSUserDefaults standardUserDefaults]setObject:userInfo forKey:@"userinfo"];
    }
    
    
}
-(BOOL)isLogin
{
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"];
    if (array != nil) {
        return YES;
    }
    return NO;
}

-(void)clearUserInfo
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userinfo"];
}

@end
