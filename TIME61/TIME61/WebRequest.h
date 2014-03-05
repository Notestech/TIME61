//
//  WebRequest.h
//  TIME61
//
//  Created by zhibincai on 2/20/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebRequest : NSObject

+(id)requestJSON:(NSString *)urlString;

+(NSData *)requestURL:(NSString *)urlString inMethod:(NSString *)method parameters:(NSString *)parameters;

@end
