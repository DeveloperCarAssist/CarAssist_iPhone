//
//  WarningLightCollectionViewController.h
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WarningLightStockService.h"

@interface WarningLightCollectionViewController : UIViewController

@property (nonatomic) WarningLightStockService* warningLightStockService;
@property (nonatomic) IBOutlet UICollectionView* warningLightCollectionView;

@end
