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
    warningLight = [[WarningLight alloc] initWithName:@"Bremsanlage" Info:@"Eine noch andere Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"parkbremse" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse" Info:@"Eine noch andere Information" AndImage:image];
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

- (void) initWarningLights
{
    NSMutableArray* warningLights = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abs" ofType:@"png"]];
    WarningLight* warningLight = [[WarningLight alloc] initWithName:@"ABS" Info:@"Die ABS-Funktion ihres Fahrzeuges ist beeinträchtigt. Sollte die ABS-Warnleuchte während der Fahrt aufleuchten, kontaktieren Sie schnellstmöglich eine Werkstatt Ihres Vertrauens." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"airbag" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Airbag" Info:@"Die Airbag-Funktion ihres Fahrzeuges ist beeinträchtigt. Sollte die Airbag-Warnleuchte während der Fahrt aufleuchten, kontaktieren Sie schnellstmöglich eine Werkstatt Ihres Vertrauens." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alternator" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Lichtmaschine" Info:@"Die Lichtmaschine ihres Fahrzeuges ist beeinträchtigt. Es sind Störungen beim Fahrzeug-Start zu erwarten. Sollte die Lichtmaschinen-Warnleuchte während der Fahrt aufleuchten, kontaktieren Sie schnellstmöglich eine Werkstatt Ihres Vertrauens." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"electronic_immobilizer" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse" Info:@"Eine noch andere Information" AndImage:image];
    [warningLights addObject:warningLight];
    
    self.warningLights = warningLights;
}

@end
