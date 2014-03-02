//
//  PaintsModel.h
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseModel.h"

@interface PaintsModel : BaseModel

@property(strong,nonatomic)NSString  *paintsURL;
@property(strong,nonatomic)NSString  *owner;
@property(strong,nonatomic)NSString  *title;
@property(strong,nonatomic)NSString  *share;
@property(strong,nonatomic)NSString  *comment;
@property(strong,nonatomic)NSString  *love;

@end
