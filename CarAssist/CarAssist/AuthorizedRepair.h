//
//  AuthorizedRepair.h
//  CarAssist
//
//  Created by 0holst on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "SearchableItem.h"

@interface AuthorizedRepair : NSObject<SearchableItem>
@property (nonatomic) NSString *name; // Name des Autohaues
@property (nonatomic) NSString *categoryName; // Bundesland
@property (nonatomic) NSString *street;
@property (nonatomic) NSString *postalcode;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *phone;

@property (nonatomic) CLLocationCoordinate2D location;

-(AuthorizedRepair *)initWithName:(NSString *) name Category:(NSString *)category andLocation:(CLLocationCoordinate2D) location;
@end
