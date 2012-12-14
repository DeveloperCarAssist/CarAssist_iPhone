//
//  Auto.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Car.h"

@implementation Car

-(Car*) initWithExampleDataBmwZ4
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid=1;
        self.model = @"Z4";
        self.manufacturer = @"BMW";
        self.equipmentPackage.radio = @"Radio Professional";
        self.equipmentPackage.navigationDevice = @"TomTom";
        self.owner=@"Klaus' Auto";
        self.vehicalIdentNumber=@"1";
    }
    return self;
}

-(Car*) initWithExampleDataVWGolfIV
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid = 2;
        self.model = @"Golf IV 1.6";
        self.manufacturer = @"VW";
        self.equipmentPackage.radio=@"Beta";
        self.vehicalIdentNumber = @"2";
        self.equipmentPackage.navigationDevice = @"kein";
        self.owner = @"Gerds Auto";
    }
    return self;
}

-(Car*) initNewCar
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid=0;
        self.model = @"";
        self.manufacturer = @"";
        self.equipmentPackage.radio = @"Standard";
        self.equipmentPackage.navigationDevice = @"Standard";
    }
    return self;
}

-(BOOL) isEqual:(Car*)car
{
    if (![self.model isEqualToString:car.model]) {
        return NO;
    }
    
    if (![self.manufacturer isEqualToString:car.manufacturer]) {
        return NO;
    }
    
    if (![self.equipmentPackage.radio isEqualToString:car.equipmentPackage.radio]) {
        return NO;
    }
    
    if (![self.equipmentPackage.seats isEqualToString:car.equipmentPackage.seats]) {
        return NO;
    }
    
    if (![self.equipmentPackage.navigationDevice isEqualToString:car.equipmentPackage.navigationDevice]) {
        return NO;
    }
    
    if (![self.equipmentPackage.steeringWheel isEqualToString:car.equipmentPackage.steeringWheel]) {
        return NO;
    }
    
    if (![self.gearbox isEqualToString:car.gearbox]) {
        return NO;
    }
    
    if (![self.owner isEqualToString:car.owner]) {
        return NO;
    }
    return YES;
}

-(NSUInteger) hash
{
    // TODO: implement better Hashcode?
    NSUInteger hash = (self.model.length * self.manufacturer.length);
    return hash;
}


- (void) standardInit
{
    self.unid = 0;
    
    self.model = @"Standard";
    self.manufacturer = @"Standard";
    self.owner = @"Standard";
    self.gearbox = @"Standard";
    self.insurance = @"Standard";
    self.garage = @"Standard";
    self.equipmentPackage = [[CarEquipmentPackage alloc] init];
}

@end
