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
        self.unid=1;
        self.model=@"Z4";
        self.manufacturer=@"BMW";
        self.radio=@"Standard";
        self.seatHeater=@"Standard";
        self.navigation=@"TomTom";
        self.owner=@"Klaus' Auto";
    }
    return self;
}

-(Car*) initWithExampleDataVWGolfIV
{
    self = [super init];
    if (self)
    {
        self.unid=2;
        self.model=@"Golf IV 1.6";
        self.manufacturer=@"VW";
        self.radio=@"Beta";
        self.seatHeater=@"Standard";
        self.navigation=@"kein";
        self.owner=@"Gerds Auto";
    }
    return self;
}

-(Car*) initNewCar
{
    self = [super init];
    if (self)
    {
        self.unid=0;
        self.model=@"";
        self.manufacturer=@"";
        self.radio=@"Standard";
        self.seatHeater=@"Standard";
        self.navigation=@"Standard";
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
    
    if (![self.radio isEqualToString:car.radio]) {
        return NO;
    }
    
    if (![self.seatHeater isEqualToString:car.seatHeater]) {
        return NO;
    }
    
    if (![self.navigation isEqualToString:car.navigation]) {
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




@end
