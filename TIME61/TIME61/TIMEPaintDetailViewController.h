//
//  TIMEPaintDetailViewController.h
//  TIME61
//
//  Created by zhibincai on 2/22/14.
//  Copyright (c) 2014 caizhibin. All rights reserved.
//

#import "BaseViewController.h"

@class PaintsModel;

@interface TIMEPaintDetailViewController : BaseViewController<UIScrollViewDelegate>
{
@private
    UIScrollView *_scrollView;
}
@property(strong,nonatomic)IBOutlet UIImageView *detailPaintView;
@property(nonatomic)PaintsModel *paintsModel;

@end
