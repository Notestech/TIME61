//
//  TIMECustomToyCell.h
//  TIME61
//
//  Created by zhibincai on 2/20/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToyModel;

@interface TIMECustomToyCell : UITableViewCell
{
    UIImageView     *_paintsView;
    UILabel         *_ownerLable;
    UIImageView     *_toyView;
}

@property(nonatomic)ToyModel *toyModel;

@end
