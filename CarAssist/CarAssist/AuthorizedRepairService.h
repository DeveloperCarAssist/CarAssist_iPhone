//
//  AuthorizedRepairService.h
//  CarAssist
//
//  Created by Dennis on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SearchableService.h"
#import <CoreLocation/CoreLocation.h>

@interface AuthorizedRepairService : SearchableService
-(SearchableService*) initWithCar:(Car *) car andUserLocation:(CLLocation *) loc;
@end
