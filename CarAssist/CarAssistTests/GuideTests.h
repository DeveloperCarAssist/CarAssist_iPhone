//
//  GuideTests.h
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Guide.h"

@interface GuideTests : SenTestCase

@property (nonatomic) Guide* testGuide;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSArray *steps;

@end
