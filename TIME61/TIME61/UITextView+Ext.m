//
//  UITextView+Ext.m
//  TIME61
//
//  Created by zhibincai on 2/28/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "UITextView+Ext.h"

@implementation UITextView (Ext)

-(CGSize)getSizeWithWidth:(CGFloat)width
{
    CGSize size = self.contentSize;
    //IOS7获取TextView高度
    if (IOS7_OR_LATER) {
        NSString *_content = [NSString stringWithFormat:@"%@\n",self.text];
        
        CGRect textRect = [_content boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil] context:nil];
        size = textRect.size;
    }
    return size;
}
@end
