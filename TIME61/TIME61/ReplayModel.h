//
//  ReplayModel.h
//  TIME61
//
//  Created by zhibincai on 2/27/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseModel.h"
#import "UserModel.h"

@interface ReplayModel : BaseModel


@property(nonatomic)UserModel *owner;
@property(nonatomic)NSString *time;
@property(nonatomic)NSString *content;

@end
