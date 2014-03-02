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
@property(nonatomic)NSString *paintURL;         //玩具原画URL
@property(nonatomic)NSString *toyURL;             //玩具实体模型URL

@end
