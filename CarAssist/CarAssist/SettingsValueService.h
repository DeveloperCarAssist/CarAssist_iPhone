//
//  SettingsValueServiceCar.h
//  CarAssist
//
//  Created by 0michiel on 18.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import "SearchableService.h"
#import <Foundation/Foundation.h>
#import "Car.h"

@interface SettingsValueService : SearchableService

@property (nonatomic) Car* car;
@property (nonatomic) NSMutableDictionary* settingValues;
@property (nonatomic) NSMutableDictionary* settingValuesRepresentations;
@property (nonatomic) NSMutableDictionary* settingImageRepresentations;

@end