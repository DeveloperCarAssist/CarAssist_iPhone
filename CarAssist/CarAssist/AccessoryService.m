//
//  AccessoryService.m
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AccessoryService.h"

@implementation AccessoryService
-(AccessoryService*) initWithCar:(Car *) car
{
    self = [super init];
    if(self)
    {
        switch (car.unid) {
            case 1:
                [self initRadioBmwZ4];
                break;
            case 2:
                [self initRadioVWGolfIV];
                break;
            default:
                @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"no service data for selected car" userInfo:nil];
                break;
        }
    }
return self;
}

-(void) initRadioBmwZ4
{
    NSMutableArray *list = [NSMutableArray array];
    [list addObject: @"Radio Professional"];
    [list addObject: @"DVD-System Advanced"];
       [list addObject: @"HiFi-System ALPINE"];
    self.radios=list;
}
-(void) initRadioVWGolfIV
{
    NSMutableArray *list = [NSMutableArray array];
    [list addObject: @"CD-Radio gamma"];
    [list addObject: @"CD-Radio RCD 210"];
    [list addObject: @"CD-Radio RCD 3002"];
    self.radios=list;
}
@end
