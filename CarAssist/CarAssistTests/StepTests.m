//
//  StepTests.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "StepTests.h"

@implementation StepTests

- (void) setUp
{
    [super setUp];
    
    self.name = @"TestStep";
    self.desc = @"TestDescription";
    self.image = [[UIImage alloc] init];
    
    self.testStep = [[Step alloc] initWithName:self.name Description:self.desc AndImage:self.image];
}

- (void) testGetterOfProperties
{
    STAssertEquals(self.name, self.testStep.name, @"Getter for property name has failed.");
    STAssertEquals(self.desc, self.testStep.desc, @"Getter for property description has failed.");
    STAssertEquals(self.image, self.testStep.image, @"Getter for property image has failed.");
}

@end
