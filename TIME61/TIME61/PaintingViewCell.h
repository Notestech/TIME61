//
//  PaintingViewCell.h
//  TIME61
//
//  Created by zhibincai on 11/10/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintingViewCell : UICollectionViewCell

@property(strong,nonatomic)IBOutlet UIImageView  *paintingView;
@property(strong,nonatomic)IBOutlet UILabel      *userLable;
@property(strong,nonatomic)IBOutlet UILabel      *barLable;

@end
