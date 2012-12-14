//
//  CarSettingsHelper.h
//  CarAssist
//
//  Created by 0witt on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface CarSettingsHelper : NSObject

@property (nonatomic) Car* car;
@property (nonatomic) NSMutableArray* sections;
@property (nonatomic) NSMutableArray* settings;
@property (nonatomic) NSMutableDictionary* settingsData;
@property (nonatomic) NSMutableDictionary* settingsOptions;

- (id) initWithCar: (Car*) car;

@end
