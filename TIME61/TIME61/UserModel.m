//
//  UserModel.m
//  TIME61
//
//  Created by zhibincai on 2/27/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
-(NSDictionary *)attributeMapDictionary
{
    NSDictionary *attrMap = @{@"name":@"name",
                              @"tou":@"tou"
                              };
    return attrMap;
}
-(void)setAttribbutes:(NSDictionary *)dataDic
{
    [super setAttribbutes:dataDic];
}
@end
