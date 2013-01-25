//
//  SettingsValueService.m
//  CarAssist
//
//  Created by 0michiel on 18.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import "SettingsValueService.h"
#import "CarEquipmentPackage.h"

@implementation SettingsValueService

- (SearchableService*) initWithCar: (Car*) car
{
    self = [super initWithCar:car];
    if (self)
    {
        self.settingValues = [NSMutableDictionary dictionary];
        self.settingValuesRepresentations = [NSMutableDictionary dictionary];
        self.settingImageRepresentations = [NSMutableDictionary dictionary];
        
        switch (car.manufacturerID)
        {
            case 1:
                [self initAudiSettingsValues];
                break;
            case 2:
                [self initDefaultSettingsValues];
//                [self initBMWSettingsValues];
                break;
            case 3:
                [self initDefaultSettingsValues];
//                [self initVWSettingsValues];
                break;
            default:
                [self initDefaultSettingsValues];
                break;
        }
    }
    return self;
}

- (void) initDefaultSettingsValues
{
    NSString* settingName = @"Versicherung";
    NSMutableArray* values = [NSMutableArray array];
    NSMutableArray* valueRepresentations = [NSMutableArray array];
    NSMutableArray* images = [NSMutableArray array];
    [values addObject:@"Allianz"];
    [values addObject:@"HUK Coburg"];
    [values addObject:@"Mannheimer"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Ausstattungspaket";
    values = [NSMutableArray array];
    images = [NSMutableArray array];
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
    images = [NSMutableArray array];
    [values addObject:@"Std. Navi"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abs" ofType:@"png"]]];
    [values addObject:@"Extended Navi"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"parkbremse" ofType:@"png"]]];
    [values addObject:@"Extended Navi mit Bonus-Maps"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mmi_navigation_plus" ofType:@"png"]]];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    [self.settingImageRepresentations setObject:images forKey:settingName];
    
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

- (void) initAudiSettingsValues
{
    NSString* settingName = @"Versicherung";
    NSMutableArray* values = [NSMutableArray array];
    NSMutableArray* valueRepresentations = [NSMutableArray array];
    NSMutableArray* images = [NSMutableArray array];
    [values addObject:@"Allianz"];
    [values addObject:@"HUK Coburg"];
    [values addObject:@"Mannheimer"];
    [values addObject:@"VHV Versicherung"];
    [values addObject:@"Direct Line"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    
    settingName = @"Ausstattungspaket";
    values = [NSMutableArray array];
    valueRepresentations = [NSMutableArray array];
    images = [NSMutableArray array];
    CarEquipmentPackage* equipmentPackage = [[CarEquipmentPackage alloc] initWithPackageName:@"Attraction" NavigationDevice:@"Kein Navigationsgerät vorhanden" Radio:@"Radioanlage chorus" SteeringWheel:@"Lenkrad im 4-Speichen-Design" AndSeats:@"Titangraue Cosinus Sitze"];
    [values addObject: equipmentPackage];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"a4_avant_attraction" ofType:@"png"]]];
    [valueRepresentations addObject:equipmentPackage.packageName];
    equipmentPackage = [[CarEquipmentPackage alloc] initWithPackageName:@"Ambition" NavigationDevice:@"Kein Navigationsgerät" Radio:@"Radioanlage chorus" SteeringWheel:@"Sportlederlenkrad im 3-Speichen-Design" AndSeats:@"Titangraue Atrium Sitze"];
    [values addObject: equipmentPackage];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"a4_avant_ambition" ofType:@"png"]]];
    [valueRepresentations addObject:equipmentPackage.packageName];
    equipmentPackage = [[CarEquipmentPackage alloc] initWithPackageName:@"Ambiente" NavigationDevice:@"Kein Navigationsgerät" Radio:@"Radioanlage chorus" SteeringWheel:@"Multifunktions-Lederlenkrad im 4-Speichen-Design" AndSeats:@"Titangraue Silhouette Sitze"];
    [values addObject: equipmentPackage];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"a4_avant_ambiente" ofType:@"png"]]];
    [valueRepresentations addObject:equipmentPackage.packageName];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:valueRepresentations forKey:settingName];
    [self.settingImageRepresentations setObject:images forKey:settingName];
    
    settingName = @"Navigationsgerät";
    values = [NSMutableArray array];
    images = [NSMutableArray array];
    [values addObject:@"Kein Navigationsgerät"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nicht_vorhanden" ofType:@"png"]]];
    [values addObject:@"MMI® Navigation"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mmi_navigation" ofType:@"png"]]];
    [values addObject:@"MMI® Navigation plus"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mmi_navigation_plus" ofType:@"png"]]];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    [self.settingImageRepresentations setObject:images forKey:settingName];
    
    settingName = @"Radio";
    values = [NSMutableArray array];
    images = [NSMutableArray array];
    [values addObject:@"Radioanlage chorus"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"radioanlage_chorus" ofType:@"png"]]];
    [values addObject:@"Radioanlage concert"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"radioanlage_concert" ofType:@"png"]]];
    [values addObject:@"Radioanlage symphony"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"radioanlage_symphony" ofType:@"png"]]];
    [values addObject:@"CD-Wechsler"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cd_wechsler" ofType:@"png"]]];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    [self.settingImageRepresentations setObject:images forKey:settingName];
    
    settingName = @"Lenkrad";
    values = [NSMutableArray array];
    images = [NSMutableArray array];
    [values addObject:@"Sportlederlenkrad im 3-Speichen-Design"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sportlederlenkrad_3_speichen_design" ofType:@"png"]]];
    [values addObject:@"Multifunktions-Sportlederlenkrad im 3-Speichen-Design"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"multifunktionssportlederlenkrad_3_speichen_design" ofType:@"png"]]];
    [values addObject:@"Lenkrad im 4-Speichen-Design"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lenkrad_4_speichen_design" ofType:@"png"]]];
    [values addObject:@"Multifunktions-Sportlederlenkrad im 3-Speichen-Design, unten abgeflacht"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"multifunktionssportlederlenkrad_3_speichen_design_unten_abgeflacht" ofType:@"png"]]];
    [values addObject:@"Multifunktions-Sportlederlenkrad im 3-Speichen-Design mit Schaltwippen"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"multifunktionssportlederlenkrad_3_speichen_design_mit_schaltwippen" ofType:@"png"]]];
    [values addObject:@"Multifunktions-Lederlenkrad im 4-Speichen-Design"];
    [images addObject:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"multifunktionssportlederlenkrad_4_speichen_design" ofType:@"png"]]];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
    [self.settingImageRepresentations setObject:images forKey:settingName];
    
    settingName = @"Sitze";
    values = [NSMutableArray array];
    [values addObject:@"Stoff Silhouette"];
    [values addObject:@"Alcantara/Leder-Kombination"];
    [values addObject:@"Leder Milano"];
    [values addObject:@"Leder Feinnappa"];
    [values addObject:@"Titangraue Cosinus Sitze"];
    [values addObject:@"Titangraue Atrium Sitze"];
    [values addObject:@"Titangraue Silhouette Sitze"];
    [self.settingValues setObject:values forKey:settingName];
    [self.settingValuesRepresentations setObject:values forKey:settingName];
}
    
    

@end
