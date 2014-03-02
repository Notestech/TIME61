//
//  BaseModel.m
//  TIME61
//
//  Created by zhibincai on 11/8/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

-(id)initWithDataDic:(NSDictionary *)dataDic;
{
    if (self = [super init]) {
        [self setAttribbutes:dataDic];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        NSDictionary *attrMapDic = [self attributeMapDictionary];
        if (attrMapDic == nil) {
            return self;
        }
        
        NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
        id attributeName;
        while ((attributeName = [keyEnum nextObject])) {
            SEL sel = [self getSetterSelWithAttibuteName:attributeName];
            if ([self respondsToSelector:sel]) {
                id obj = [decoder decodeObjectForKey:attributeName];
                [self performSelectorOnMainThread:sel withObject:obj waitUntilDone:[NSThread isMainThread]];
            }
        }
        
    }
    return self;
}

-(NSDictionary *)attributeMapDictionary
{
    return nil;
}
-(void)setAttribbutes:(NSDictionary *)dataDic
{
    NSDictionary *attrMapDic = [self attributeMapDictionary];
    if (attrMapDic == nil) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:[dataDic count]];
        for (NSString *key in dataDic) {
            [dic setValue:key forKey:key];
            attrMapDic = dic;
        }
    }
    NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
    id attributeName;
    while ((attributeName = [keyEnum nextObject])) {
        SEL sel = [self getSetterSelWithAttibuteName:attributeName];
        if ([self respondsToSelector:sel]) {
            NSString *dataDicKey = [attrMapDic objectForKey:attributeName];
            id attributeValue = [dataDic objectForKey:dataDicKey];
            
            
            [self performSelectorOnMainThread:sel withObject:attributeValue waitUntilDone:[NSThread isMainThread]];
        }
    }
}

-(NSString *)description
{
    NSMutableString *attrsDesc = [NSMutableString stringWithCapacity:100];
	NSDictionary *attrMapDic = [self attributeMapDictionary];
	NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
	id attributeName;
	
	while ((attributeName = [keyEnum nextObject])) {
		SEL getSel = NSSelectorFromString(attributeName);
		if ([self respondsToSelector:getSel]) {
			NSMethodSignature *signature = nil;
			signature = [self methodSignatureForSelector:getSel];
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
			[invocation setTarget:self];
			[invocation setSelector:getSel];
			NSObject *valueObj = nil;
			[invocation invoke];
			[invocation getReturnValue:&valueObj];
			if (valueObj) {
//                NSLog(@"valueobj:%@",(NSString *)valueObj);
				[attrsDesc appendFormat:@" [%@=%@] ",attributeName, valueObj];
                
			}else {
				[attrsDesc appendFormat:@" [%@=nil] ",attributeName];
			}
			
		}
	}
	
	NSString *customDesc = [self customDescription];
	NSString *desc;
	
	if (customDesc && [customDesc length] > 0 ) {
		desc = [NSString stringWithFormat:@"%@:{%@,%@}",[self class],attrsDesc,customDesc];
	}else {
		desc = [NSString stringWithFormat:@"%@:{%@}",[self class],attrsDesc];
	}
    
	return desc;
}

-(NSString *)customDescription
{
    return nil;
}

-(NSData *)getArchiveData
{
    return [NSKeyedArchiver archivedDataWithRootObject:self];
}

-(NSString *)cleanString:(NSString *)string
{
    if (string == nil) {
        return @"";
    }
    NSMutableString *cleanString = [NSMutableString stringWithString:string];
    [cleanString replaceOccurrencesOfString:@"\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [cleanString length])];
    [cleanString replaceOccurrencesOfString:@"\r" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [cleanString length])];
    
    return cleanString;
}


#pragma mark - private method
-(SEL)getSetterSelWithAttibuteName:(NSString*)attributeName{
	NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
	NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
	return NSSelectorFromString(setterSelStr);
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    NSDictionary *attrMapDic = [self attributeMapDictionary];
    if (attrMapDic == nil) {
        return;
    }
    NSEnumerator *keyEnum = [attrMapDic keyEnumerator];
    id attributeName;
    
    while ((attributeName = [keyEnum nextObject])) {
        SEL getSel = NSSelectorFromString(attributeName);
        if ([self respondsToSelector:getSel]) {
            NSMethodSignature *signature = nil;
            signature = [self methodSignatureForSelector:getSel];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setTarget:self];
            [invocation setSelector:getSel];
            
            NSObject *valueObj = nil;
            [invocation invoke];
            [invocation getReturnValue:&valueObj];
            
            if (valueObj) {
                [encoder encodeObject:valueObj forKey:attributeName];
            }
        }
    }
}

#ifdef _FOR_DEBUG_
-(BOOL) respondsToSelector:(SEL)aSelector {
    //    printf("SELECTOR: %s\n", [NSStringFromSelector(aSelector) UTF8String]);
    return [super respondsToSelector:aSelector];
}
#endif
@end
