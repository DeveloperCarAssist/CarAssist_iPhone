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
    [NSException exceptionWithName:NSInternalInconsistencyException reason:@"The Class Profile is a singleton. You are not allowed to initialize it. Use getProfile instead!" userInfo:nil ];
    return nil;
}

-(Profil*) initWithExampleData
{
    self = [super init];
    if (self)
    {   
        self.car=[[Car alloc]initWithExampleDataBmwZ4];
        self.carList=[[NSMutableArray alloc] initWithObjects: self.car , nil];
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

-(void)setCar:(Car *)car
{
    _car = car;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"defaultCarChanged" object:self];
}

@end
