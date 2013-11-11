//
//  CartonViewCell.h
//  TIME61
//
//  Created by zhibincai on 11/9/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToyModel;

@interface CartonViewCell : UICollectionViewCell{
@private
    UIImageView *_paintingView;
    UIImageView *_modelView;
    UILabel     *_ownerLable;
}
@property(strong,nonatomic)IBOutlet UILabel *ownerLable;
@property(strong,nonatomic)IBOutlet UIImageView *paintingView;
@property(strong,nonatomic)IBOutlet UIImageView *modelView;
@property(nonatomic)ToyModel *toyModel;
@end
