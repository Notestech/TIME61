//
//  TIMEHomeViewController.h
//  TIME61
//
//  Created by caizhibin on 13-11-1.
//  Copyright (c) 2013年 caizhibin. All rights reserved.
//

#import "BaseViewController.h"
#import "SGFocusImageFrame.h"

//@class ToyModel;

@interface TIMEHomeViewController : BaseViewController<SGFocusImageFrameDelegate>

@property(strong,nonatomic)IBOutlet UICollectionView *collectionView;

@property(nonatomic)NSArray *data;
//@property(nonatomic)ToyModel *toyModel;

@end
