//
//  StepTests.h
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Step.h"

@interface StepTests : SenTestCase

@property (nonatomic) Step* testStep;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *desc;
@property (nonatomic) UIImage *image;

@end
