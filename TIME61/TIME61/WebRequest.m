//
//  WebRequest.m
//  TIME61
//
//  Created by zhibincai on 2/20/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "WebRequest.h"

@implementation WebRequest

+(id)requestJSON:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    if (response == nil) {
        return nil;
    }
    return response;
}

+(NSData *)requestInPOST:(NSString *)urlString parameters:(NSString *)parameters
{
    //提交地址
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    //创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];//设置请求方式为POST,默认为GET
    
    //设置请求参数
    
    NSData *data = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    //链接服务器
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    return received;
}

/*
 //提交地址
 NSURL *url = [[NSURL alloc] initWithString:@"http://time61/user/signin.php"];
 //创建请求
 NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
 [request setHTTPMethod:@"POST"];//设置请求方式为POST,默认为GET
 NSString *parameters = [NSString stringWithFormat:@"name=%@&pwd=%@",_nameText.text,_pwdText.text];//设置请求参数
 NSData *data = [parameters dataUsingEncoding:NSUTF8StringEncoding];
 [request setHTTPBody:data];
 
 //链接服务器
 NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
 
 NSString *receiveStr = [[NSString alloc] initWithData:received encoding:NSUTF8StringEncoding];
 */
@end
