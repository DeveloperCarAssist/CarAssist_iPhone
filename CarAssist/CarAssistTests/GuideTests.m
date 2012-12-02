//
//  GuideTests.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "GuideTests.h"

@implementation GuideTests

- (void) setUp
{
    [super setUp];
    
    self.name = @"TestStep";
    self.categoryName = @"TestCategory";
    self.steps = [NSArray array];
    
    self.testGuide = [[Guide alloc] initWithName:self.name CategoryName:self.categoryName AndSteps:self.steps];
}

- (void) testGetterOfProperties
{
    STAssertEquals(self.name, self.testGuide.name, @"Getter for property name has failed.");
    STAssertEquals(self.categoryName, self.testGuide.categoryName, @"Getter for property category name has failed.");
    STAssertEquals(self.steps, self.testGuide.steps, @"Getter for property steps has failed.");
}

@end
