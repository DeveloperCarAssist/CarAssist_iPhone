//
//  Profil.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Profil.h"

@implementation Profil

// singleton-instance
static Profil* instance;

- (id) init
{
    [NSException raise:@"The Class Profile is a singleton. You are not allowed to initialize it. Use getProfile instead!" format:@"foo of %d is invalid"];
}

-(Profil*) initWithExampleData
{
    self = [super init];
    if (self)
    {
        Car *car = [[Car alloc ]initWithExampleData];
        
        self.car=[[Car alloc]initWithExampleData];
        self.carList=[[NSMutableArray alloc] initWithObjects: car , nil];
        self.vorname=@"Klaus";
        self.nachname=@"Kastikus";
        self.emailAdresse=@"KlauKastikus@googlemail.com";
        self.lieblingsKEKSEEE=@"Oreo Keks";
    }
    return self;
}

+ (Profil*) getProfil
{
    if (!instance) {
        instance = [[Profil alloc] initWithExampleData];
    }
    
    return instance;
}

@end
