//
//  ToyModel.h
//  TIME61
//
//  Created by zhibincai on 11/8/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "BaseModel.h"

@interface ToyModel : BaseModel

@property(nonatomic)NSString *owner;                //玩具主人
@property(nonatomic)NSString *paintingURL;         //玩具原画URL
@property(nonatomic)NSString *modelURL;             //玩具实体模型URL

@end
