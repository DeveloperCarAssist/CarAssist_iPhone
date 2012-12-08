//
//  Profil.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Profil.h"

@implementation Profil

    static Profil* instance;




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
