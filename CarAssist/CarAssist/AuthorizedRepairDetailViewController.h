//
//  AuthorizedRepairDetailViewController.h
//  CarAssist
//
//  Created by Dennis on 25.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthorizedRepair.h"
#import <MapKit/MapKit.h>


@interface AuthorizedRepairDetailViewController : UIViewController
- (id)initWithAuthorizedRepair:(AuthorizedRepair *) shop;
@property  (nonatomic) IBOutlet MKMapView *mapView;
@end
