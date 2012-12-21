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
    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"The Class Profile is a singleton. You are not allowed to initialize it. Use getProfile instead!" userInfo:nil] raise];
    return nil;
}

-(Profile*) initWithExampleData
{
    self = [super init];
    if (self)
    {   
        _car = nil;
        self.carList = [NSMutableArray array];
        self.vorname = @"Klaus";
        self.nachname = @"Kastikus";
        self.emailAdresse = @"KlauKastikus@googlemail.com";
        self.lieblingsKEKSEEE = @"Oreo Keks";
        self.ADAClicence = @"007";
        self.mobilenumber = 017666666;
        self.homeTown = @"RIP-TOWN";
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

-(void)setCar:(Car *)car
{
    _car = car;
    NSDictionary *userinfo = [NSDictionary dictionaryWithObject:car forKey:@"car"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"defaultCarChanged" object:self userInfo:userinfo];
}

@end
