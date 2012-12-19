//
//  CarEquipmentPackage.m
//  CarAssist
//
//  Created by 0witt on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarEquipmentPackage.h"

@implementation CarEquipmentPackage

- (id) init
{
    self = [super init];
    if (self) {
        self.packageName = @"Standard";
        self.navigationDevice = @"Standard";
        self.radio = @"Standard";
        self.steeringWheel = @"Standard";
        self.seats = @"Standard";
    }
    return self;
}

- (CarEquipmentPackage*) initWithPackageName: (NSString*) packageName NavigationDevice: (NSString*) navigationDevice Radio: (NSString*) radio SteeringWheel: (NSString*) steeringWheel AndSeats: (NSString*) seats
{
    self = [super init];
    if (self) {
        self.packageName = packageName;
        self.navigationDevice = navigationDevice;
        self.radio = radio;
        self.steeringWheel = steeringWheel;
        self.seats = seats;
    }
    return self;
}

@end
