//
//  ServiceGuideStockServiceTest.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceGuideStockServiceTest.h"

@implementation ServiceGuideStockServiceTest

- (void)setUp
{
    [super setUp];
    
    self.serviceGuideStockService = [[SearchableService alloc] init];
}

- (void) testContructor
{
    STAssertNotNil(self.serviceGuideStockService, @"Service should have been initialized.");
}

- (void) testCategories
{
    NSArray* keys = [self.serviceGuideStockService.items allKeys];
    STAssertTrue(keys.count == 1, @"Wrong Number of Categories. Expected: 1, but was: %@", keys.count);
    STAssertEqualObjects([keys objectAtIndex:0], @"Reifen", @"Expected: Reifen, but was: %@", [keys objectAtIndex:0]);
}

@end
