//
//  ToyModel.m
//  TIME61
//
//  Created by zhibincai on 11/8/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "ToyModel.h"

@implementation ToyModel

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *attrMap = @{@"owner": @"owner",
                              @"paintURL":@"paintingURL",
                              @"toyURL":@"modelURL"};
    return attrMap;
}

-(void)setAttribbutes:(NSDictionary *)dataDic
{
    [super setAttribbutes:dataDic];
    
}

-(id)copyWithZone:(NSZone *)zone
{
    ToyModel *copy = [super copyWithZone:zone];
    copy.owner = _owner;
    copy.paintURL = _paintURL;
    copy.toyURL = _toyURL;
    
    return copy;
}

@end
