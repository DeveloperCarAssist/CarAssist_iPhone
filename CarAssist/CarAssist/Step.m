//
//  Step.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "Step.h"

@implementation Step

- (Step*) initWithName: (NSString*) name Description: (NSString*) desc AndImage: (UIImage*) image
{
    self = [super init];
    if (self) {
        self.name = name;
        self.desc = desc;
        self.image = image;
    }
    return self;
}

@end
