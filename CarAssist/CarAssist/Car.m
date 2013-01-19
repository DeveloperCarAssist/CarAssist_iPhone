//
//  Auto.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Car.h"
#import "AuthorizedRepair.h"

@implementation Car

-(Car*) initWithExampleDataAudi
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid = 1;
        self.manufacturerID = 1;
        self.model = @"";
        self.manufacturer = @"Audi";
        self.equipmentPackage.radio=@"Standard";
        self.vehicalIdentNumber = @"";
        self.equipmentPackage.navigationDevice = @"Kein Navigationsgerät vorhanden";
        self.owner = @"Unbekannt";
    }
    return self;
}

-(Car*) initWithExampleDataBMW
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid = 2;
        self.manufacturerID = 2;
        self.model = @"";
        self.manufacturer = @"BMW";
        self.equipmentPackage.radio = @"Standard";
        self.equipmentPackage.navigationDevice = @"Kein Navigationsgerät vorhanden";
        self.owner=@"Unbekannt";
        self.vehicalIdentNumber=@"";
    }
    return self;
}

-(Car*) initWithExampleDataVW
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid = 3;
        self.manufacturerID = 3;
        self.model = @"";
        self.manufacturer = @"VW";
        self.equipmentPackage.radio=@"Standard";
        self.vehicalIdentNumber = @"";
        self.equipmentPackage.navigationDevice = @"Kein Navigationsgerät vorhanden";
        self.owner = @"Unbekannt";
    }
    return self;
}

-(Car*) initNewCar
{
    self = [super init];
    if (self)
    {
        [self standardInit];
        self.unid = 0;
        self.model = @"";
        self.manufacturer = @"";
        self.equipmentPackage.radio = @"Standard";
        self.equipmentPackage.navigationDevice = @"Kein Navigationsgerät vorhanden";
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
    self.manufacturerID = 0;
    
    self.model = @"Standard";
    self.manufacturer = @"Standard";
    self.owner = @"Unbekannt";
    self.gearbox = @"Standard";
    self.insurance = @"Standard";
    self.garage = [[AuthorizedRepair alloc] initWithName:@"Keine Werkstatt" Category:@"non" andLocation:CLLocationCoordinate2DMake(53.58939, 10.02297)];
    self.equipmentPackage = [[CarEquipmentPackage alloc] init];
}

@end
