//
//  WarningLightStockService.m
//  CarAssist
//
//  Created by 0witt on 25.11.12.
//  Copyright (c) 2012 0witt. All rights reserved.
//

#import "WarningLight.h"
#import "WarningLightStockService.h"

@implementation WarningLightStockService

-(WarningLightStockService*) initWithCar:(Car *) car
{
    self = [super init];
    if (self)
    {
        switch (car.unid)
        {
            case 1:
                [self initWarningLightsBmwZ4];
                break;
            case 2:
                [self initWarningLightsVWGolfIV];
                break;
            default:
                @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"no service data for selected car" userInfo:nil];
                break;
        }
    }
    
    return self;
}

-(void) initWarningLightsBmwZ4
{
    NSMutableArray* warningLights = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"warnleuchte" ofType:@"png"]];
    WarningLight* warningLight = [[WarningLight alloc] initWithName:@"Warnleuchte" Info:@"Eine Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"feststellbremsenleuchte" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Andere Warnleuchte" Info:@"Eine andere Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bremsanlage" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Bremsanlage Warnleuchte" Info:@"Eine noch andere Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"parkbremse" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse Warnleuchte" Info:@"Eine noch andere Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    self.warningLights = warningLights;
    
}

-(void) initWarningLightsVWGolfIV
{
    NSMutableArray* warningLights = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"warnleuchte" ofType:@"png"]];
    WarningLight* warningLight = [[WarningLight alloc] initWithName:@"Warnleuchte" Info:@"Eine Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    
    self.warningLights = warningLights;
    
}

@end
