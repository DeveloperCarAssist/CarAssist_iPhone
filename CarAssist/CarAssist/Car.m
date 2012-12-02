//
//  Auto.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Car.h"

@implementation Car

-(Car*) initWithExampleData
{
    self = [super init];
    if (self)
    {
        self.modell=@"Z4";
        self.producer=@"BMW";
        self.radio=@"Standard";
        self.seatHeater=@"Standard";
        self.navigation=@"TomTom";
    }
    return self;
}
@end
