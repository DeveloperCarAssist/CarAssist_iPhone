//
//  Guide.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "Guide.h"

@implementation Guide

- (Guide*) initWithName: (NSString*) name CategoryName: (NSString*) categoryName AndSteps: (NSArray*) steps
{
    self = [super init];
    if (self) {
        self.name = name;
        self.steps = steps;
        self.categoryName = categoryName;
    }
    return self;
}

@end
