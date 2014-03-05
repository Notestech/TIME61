//
//  UserManager.h
//  TIME61
//
//  Created by zhibincai on 3/4/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUserDidLoginNotification   @"kUserDidLoginNotification"
#define kUserDidLogOutNotification  @"kUserDidLogOutNotification"


@interface UserManager : NSObject

@property(nonatomic,retain)NSString *userName;
@property(nonatomic,retain)NSString *userPassword;
@property(nonatomic)BOOL            isRememberMe;
@property(nonatomic,retain)NSDictionary *userManagerPlist;


+(UserManager *)shareInstance;

-(void)clearUserInfo;
@end
