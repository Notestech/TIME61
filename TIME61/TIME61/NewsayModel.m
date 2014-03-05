//
//  NewsayModel.m
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "NewsayModel.h"

@implementation NewsayModel

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *attrMap = @{@"sayID":@"sayID",
                              @"time":@"time",
                              @"content":@"content",
                              @"paintImageURL":@"imageURL"
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

-(id)copyWithZone:(NSZone *)zone
{
    NewsayModel *copy = [super copyWithZone:zone];
    copy.sayID = _sayID;
    copy.owner = _owner;
    copy.time = _time;
    copy.content = _content;
    copy.paintImageURL = _paintImageURL;
    return copy;
}

@end
