//
//  PaintsModel.m
//  TIME61
//
//  Created by zhibincai on 2/19/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "PaintsModel.h"

@implementation PaintsModel

-(NSDictionary *)attributeMapDictionary{
    NSDictionary *attrMap = @{@"paintsURL":@"paintingURL",
                              @"owner":@"owner",
                              @"share":@"share_count",
                              @"comment":@"comment_count",
                              @"love":@"love_count"
                              };
    return attrMap;
}

-(void)setAttribbutes:(NSDictionary *)dataDic
{
    [super setAttribbutes:dataDic];
}

@end
