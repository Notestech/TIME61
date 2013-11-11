//
//  TIMEPaintingViewController.h
//  TIME61
//
//  Created by zhibincai on 11/10/13.
//  Copyright (c) 2013 caizhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIMEPaintingViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic)NSArray *data;
@property(strong,nonatomic)IBOutlet UICollectionView *collectionView;

@end
