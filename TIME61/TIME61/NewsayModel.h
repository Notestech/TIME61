//
//  NewsayModel.h
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"

@interface NewsayModel : BaseModel

@property(nonatomic)NSString *sayID;

//@property(nonatomic)NSString *tou;      //头像URL
//@property(nonatomic)NSString *user;     //用户名
@property(nonatomic)UserModel *owner;
@property(nonatomic)NSString *time;     //发表时间
@property(nonatomic)NSString *content;  //发表内容

@end
