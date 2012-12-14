//
//  CarSettingsHelper.m
//  CarAssist
//
//  Created by 0witt on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarSettingsHelper.h"

@implementation CarSettingsHelper

- (id) initWithCar: (Car*) car
{
    self = [super init];
    if (self) {
        self.car = car;
        self.settings = [NSMutableArray array];
        self.settingsData = [NSMutableDictionary dictionary];
        self.sections = [NSMutableArray array];
        [self initSettings];
        [self initSettingsDataDictionary];
        
    }
    return self;
}

- (void) initSettings
{
    NSMutableArray* carData = [NSMutableArray array];
    
    [carData addObject:@"Hersteller"];
    [carData addObject:@"Modell"];
    [carData addObject:@"Bezeichnung"];
    
    [self.settings addObject:carData];
    [self.sections addObject:@"Fahrzeug"];
    
    
    NSMutableArray* equipmentPackage = [NSMutableArray array];
    
    [equipmentPackage addObject:@"Ausstattungspaket"];
    [equipmentPackage addObject:@"Navigationsgerät"];
    [equipmentPackage addObject:@"Radio"];
    [equipmentPackage addObject:@"Lenkrad"];
    [equipmentPackage addObject:@"Sitze"];
    [equipmentPackage addObject:@"Getriebe"];

    [self.settings addObject:equipmentPackage];
    [self.sections addObject:@"Ausstattung"];
    
    
    NSMutableArray* serviceData = [NSMutableArray array];
    
    [serviceData addObject:@"Versicherung"];
    [serviceData addObject:@"Werkstätten"];
    
     [self.settings addObject:serviceData];
    [self.sections addObject:@"Dienstleister"];
}

- (void) initSettingsDataDictionary
{
    [self.settingsData setObject:self.car.equipmentPackage.packageName forKey:@"Ausstattungspaket"];
    [self.settingsData setObject:self.car.equipmentPackage.navigationDevice forKey:@"Navigationsgerät"];
    [self.settingsData setObject:self.car.equipmentPackage.radio forKey:@"Radio"];
    [self.settingsData setObject:self.car.equipmentPackage.steeringWheel forKey:@"Lenkrad"];
    [self.settingsData setObject:self.car.equipmentPackage.seats forKey:@"Sitze"];
    [self.settingsData setObject:self.car.gearbox forKey:@"Getriebe"];
    [self.settingsData setObject:self.car.manufacturer forKey:@"Hersteller"];
    [self.settingsData setObject:self.car.model forKey:@"Modell"];
    [self.settingsData setObject:self.car.owner forKey:@"Bezeichnung"];
    [self.settingsData setObject:self.car.insurance forKey:@"Versicherung"];
    [self.settingsData setObject:self.car.garage forKey:@"Werkstätten"];
}

@end
