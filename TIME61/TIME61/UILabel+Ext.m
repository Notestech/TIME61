//
//  UILabel+Ext.m
//  TIME61
//
//  Created by zhibincai on 2/28/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "UILabel+Ext.h"

@implementation UILabel (Ext)


-(CGSize)getSize
{
    CGSize lableSize = self.frame.size;
    
    NSString *_content = [NSString stringWithFormat:@"%@\n",self.text];
    //[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil]
    if (IOS7_OR_LATER) {
        CGRect lableRect =[_content boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
        lableSize = lableRect.size;
        
    }else{
        lableSize = [_content sizeWithFont:self.font forWidth:self.frame.size.width lineBreakMode:NSLineBreakByWordWrapping];
    }
    
    
    return lableSize;
}

@end
