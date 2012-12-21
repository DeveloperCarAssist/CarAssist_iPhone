//
//  SettingsValueService.m
//  CarAssist
//
//  Created by Erik Witt on 16.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SettingsValueService.h"
#import "CarEquipmentPackage.h"

@implementation SettingsValueService

- (SettingsValueService*) init
{
    self = [super init];
    if (self) {
        self.settingValues = [NSMutableDictionary dictionary];
        self.settingValuesRepresentations = [NSMutableDictionary dictionary];
        [self initSettingsValues];
    }
    return self;
}

- (void) initSettingsValues
{
    NSString* settingName = @"Versicherung";
    NSMutableArray* values = [NSMutableArray array];
    NSMutableArray* valueRepresentations = [NSMutableArray array];
    [values addObject:@"Allianz"];
    [values addObject:@"HUK Coburg"];
    [values addObject:@"Mannheimer"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Werkstatt";
    values = [NSMutableArray array];
    valueRepresentations = [NSMutableArray array];
    [values addObject:@"May und Olde"];
    [values addObject:@"BMW München"];
    [values addObject:@"Autoliv"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Ausstattungspaket";
    values = [NSMutableArray array];
    valueRepresentations = [NSMutableArray array];
    CarEquipmentPackage* equipmentPackage = [[CarEquipmentPackage alloc] initWithPackageName:@"Std. Paket" NavigationDevice:@"Std. Navi" Radio:@"Std. Radio" SteeringWheel:@"ohne Lenkrad" AndSeats:@"Std. Stoffsitze"];
    [values addObject: equipmentPackage];
    [valueRepresentations addObject:equipmentPackage.packageName];
    equipmentPackage = [[CarEquipmentPackage alloc] initWithPackageName:@"Extended Paket" NavigationDevice:@"Extended Navi" Radio:@"Extended Radio" SteeringWheel:@"Extended Lenkrad" AndSeats:@"Alkantara Ledersitze"];
    [values addObject: equipmentPackage];
    [valueRepresentations addObject:equipmentPackage.packageName];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:valueRepresentations forKey:settingName];
    
    settingName = @"Navigationsgerät";
    values = [NSMutableArray array];
    [values addObject:@"Std. Navi"];
    [values addObject:@"Extended Navi"];
    [values addObject:@"Extended Navi mit Bonus-Maps"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Radio";
    values = [NSMutableArray array];
    [values addObject:@"Beta"];
    [values addObject:@"Radio Soundwave X"];
    [values addObject:@"Extended Radio"];
    [values addObject:@"Extended Radio mit Bonus Taste"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Lenkrad";
    values = [NSMutableArray array];
    [values addObject:@"ohne Lenkrad"];
    [values addObject:@"Extended Lenkrad"];
    [values addObject:@"Extended Lenkrad mit Airbag"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Sitze";
    values = [NSMutableArray array];
    [values addObject:@"Std. Stoffsitze"];
    [values addObject:@"Sportsitze"];
    [values addObject:@"Alkantara Ledersitze"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
}

@end
