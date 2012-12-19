//
//  SettingsValueService.h
//  CarAssist
//
//  Created by Erik Witt on 16.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface SettingsValueService : NSObject

@property (nonatomic) Car* car;
@property (nonatomic) NSMutableDictionary* settingValues;
@property (nonatomic) NSMutableDictionary* settingValuesRepresentations;

@end
