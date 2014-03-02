//
//  TIMEPaintViewController.h
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseViewController.h"
@class PaintsModel;

@interface TIMEPaintViewController : UICollectionViewController


@property(strong,nonatomic)IBOutlet UICollectionView *collectionView;

@property(nonatomic)NSArray *data;
@property(nonatomic)PaintsModel *paintsModel;

@end
