//
//  PaintCollectionCell.h
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PaintsModel;

@interface PaintCollectionCell : UICollectionViewCell

@property(strong,nonatomic)IBOutlet UIImageView  *paintsView;
@property(strong,nonatomic)IBOutlet UILabel      *ownerLable;
@property(strong,nonatomic)IBOutlet UILabel      *barLable;

@property(nonatomic)PaintsModel *paintsModel;
//@property(nonatomic)Boolean
@end
