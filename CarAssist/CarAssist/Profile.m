//
//  Profil.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Profile.h"

@implementation Profile

// singleton-instance
static Profile* instance;

- (id) init
{
    [NSException exceptionWithName:NSInternalInconsistencyException reason:@"The Class Profile is a singleton. You are not allowed to initialize it. Use getProfile instead!" userInfo:nil ];
    return nil;
}

-(Profile*) initWithExampleData
{
    self = [super init];
    if (self)
    {   
        //self.car=[[Car alloc]initWithExampleDataBmwZ4];
        //self.carList=[[NSMutableArray alloc] initWithObjects: self.car , nil];
        self.vorname=@"Klaus";
        self.nachname=@"Kastikus";
        self.emailAdresse=@"KlauKastikus@googlemail.com";
        self.lieblingsKEKSEEE=@"Oreo Keks";
    }
    return self;
}

+ (Profile*) getProfile
{
    if (!instance) {
        instance = [[Profile alloc] initWithExampleData];
    }
    
    return instance;
}
+(void) setProfilWithCar: (Car*) car
{
    if (!instance.car) {
        // Dieses InitWithExampleData muss noch überarbeitet werden
        instance.car = car;
        instance.carList=[[NSMutableArray alloc] initWithObjects: car , nil];
    }
    else
    {
        [NSException exceptionWithName:NSInternalInconsistencyException reason:@"The Class Profile is a singleton. You are not allowed to SetProfilWithCar more than once!" userInfo:nil ];
    }
}

-(void)setCar:(Car *)car
{
    _car = car;
    NSDictionary *userinfo = [NSDictionary dictionaryWithObject:car forKey:@"car"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"defaultCarChanged" object:self userInfo:userinfo];
}

@end
