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
        [self initWarningLights];
    }
    
    return self;
}

-(void) initWarningLights
{
    NSMutableArray* warningLights = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bremsanlage" ofType:@"png"]];
    WarningLight* warningLight = [[WarningLight alloc] initWithName:@"Bremsanalge" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"parkbremse" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sicherheitsgurt" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Sicherheitsgurt" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"elektromechanische_lenkung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Elektromechanische Lenkung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"generator" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Generator" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroeldruck" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motoröldruck" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroelstand" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorölstand" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kuehlsystem" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Kühlsystem" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lenkungsverriegelung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Lenkungsverriegelung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuendschloss" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Zündschloss" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geschwindigkeitswarnanlage_1" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Geschwindigkeitswarnanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geschwindigkeitswarnanlage_2" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Geschwindigkeitswarnanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_adativ_curise_control_2" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Adaptive cruise controll" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"esc" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Elektronische Stabilisierungskontrolle" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abs" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Anti-Blockier-System (ABS)" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sicherheitssysteme" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Sicherheitssysteme" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bremsbelag" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Bremsbelag" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"elektromechanische_parkbremse" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifendruck" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Reifendruck" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motorsteuerung_benzin" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorsteuerung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abgass_kontrollsystem" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Abgaskontrollsystem" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dieselpartikelfilter" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Partikelfilter" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"drehzahlbegrenzung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Drehzahlbegrenzung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroelstand_gelb" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorölstand" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroelsensor" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorölsensor" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motortemperatur" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motortemperatur" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"baterieladung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Batterieladung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tanksystem" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Tanksystem" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"waschwasserstand" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Waschwasserstand" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"komfortschlussel" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Komfortschlussel" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"baterie_funkschluessel" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Batterie im Funktionsschlüssel" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lampenausfallkontrolle" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Lampenausfallkontrolle" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nebelscheinwerfer" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Nebelscheinwerfer" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nebelschlussleuchte" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Nebelschlussleuchte" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dynamische_leuchtweitenregulierung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Dynamische Leuchtweitenregulierung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"adaptive_light" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Adaptive light" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"licht-_regensensor" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Licht-/ Regensensor" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_active_lane_assist" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Audi active lane assist" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"daempferregelung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Dämpferregelung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sportdiferenzial" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Sportdifferntial" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"scheibenwischer" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Scheibenwischer" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"elektromechanische_lenkung_dynamiklenkung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Dynamiklenkung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"getriebe" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Getriebe" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AAAAA" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Drehzahlbegrenzung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    self.warningLights = warningLights;
}

@end
