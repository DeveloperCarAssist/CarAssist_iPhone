//
//  Profil.m
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import "Profil.h"

@implementation Profil

-(Profil*) initWithExampleData
{
    self = [super init];
    if (self)
    {
        self.car=[[Car alloc]initWithExampleData];
        self.vorname=@"Klaus";
        self.nachname=@"Kastikus";
        self.emailAdresse=@"KlauKastikus@googlemail.com";
        self.lieblingsKEKSEEE=@"Oreo Keks";
    }
    return self;
}

@end
