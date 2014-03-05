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

-(id)copyWithZone:(NSZone *)zone
{
    PaintsModel *copy = [super copyWithZone:zone];
    copy.paintsURL = _paintsURL;
    copy.owner = _owner;
    copy.title = _title;
    copy.share = _share;
    copy.comment = _comment;
    copy.love = _love;
    
    return copy;
}
@end
