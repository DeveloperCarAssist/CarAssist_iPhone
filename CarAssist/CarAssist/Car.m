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
        self.modell=@"Z4";
        self.producer=@"BMW";
        self.radio=@"Standard";
        self.seatHeater=@"Standard";
        self.navigation=@"TomTom";
        self.name=@"Klaus' Auto";
    }
    return self;
}

-(Car*) initWithExampleDataVWGolfIV
{
    self = [super init];
    if (self)
    {
        self.modell=@"Golf IV 1.6";
        self.producer=@"VW";
        self.radio=@"Beta";
        self.seatHeater=@"Standard";
        self.navigation=@"kein";
        self.name=@"Gerds Auto";
    }
    return self;
}

-(Car*) initNewCar
{
    self = [super init];
    if (self)
    {
        self.modell=@"";
        self.producer=@"";
        self.radio=@"Standard";
        self.seatHeater=@"Standard";
        self.navigation=@"Standard";
    }
    return self;
}

-(BOOL) isEqual:(Car*)car
{
    if (![self.modell isEqualToString:car.modell]) {
        return NO;
    }
    
    if (![self.producer isEqualToString:car.producer]) {
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
    
    if (![self.name isEqualToString:car.name]) {
        return NO;
    }
    return YES;
}

-(NSUInteger) hash
{
    // TODO: implement better Hashcode?
    NSUInteger hash = (self.modell.length * self.producer.length);
    return hash;
}




@end
