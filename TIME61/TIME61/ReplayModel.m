//
//  ReplayModel.m
//  TIME61
//
//  Created by zhibincai on 2/27/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "ReplayModel.h"

@implementation ReplayModel

-(NSDictionary *)attributeMapDictionary
{
    NSDictionary *attrMap =@{@"time":@"time",
                             @"content":@"content"
    };
    return attrMap;
}

-(void)setAttribbutes:(NSDictionary *)dataDic
{
    [super setAttribbutes:dataDic];
    
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    if (userDic != NULL) {
        UserModel *user = [[UserModel alloc]initWithDataDic:userDic];
        self.owner = user;
    }
}
@end
