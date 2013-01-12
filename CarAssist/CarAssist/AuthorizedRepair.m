//
//  AuthorizedRepair.m
//  CarAssist
//
//  Created by 0holst on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepair.h"

@implementation AuthorizedRepair
-(AuthorizedRepair *)initWithName:(NSString *) name Category:(NSString *)category andLocation:(CLLocationCoordinate2D) location
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.categoryName = category;
        self.location = [[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
    }
    return self;
}

- (NSComparisonResult)compare:(AuthorizedRepair *)otherObject {
    CLLocationDistance d1,d2;
    d1 = self.distance;
    d2 = otherObject.distance;
    
    if(d1 < d2)
    {
        return  NSOrderedAscending;
    } else if(d1 > d2) {
        return NSOrderedDescending;
    }
    return NSOrderedSame;
}

-(CLLocationDistance)distance
{
    return [self.location distanceFromLocation: self.userLocation];
}

@end
