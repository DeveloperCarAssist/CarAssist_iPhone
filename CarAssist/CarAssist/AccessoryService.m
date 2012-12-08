//
//  AccessoryService.m
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AccessoryService.h"

@implementation AccessoryService
-(AccessoryService*) init
{
    self = [super init];
    if(self)
    {
       [self initRadio];
    }
return self;
}

-(void) initRadio
{
    NSMutableArray *list = [NSMutableArray array];
    [list addObject: @"Standart"];
    [list addObject: @"KinderRigel"];
       [list addObject: @"Snickers"];
    self.radios=list;
}
@end
