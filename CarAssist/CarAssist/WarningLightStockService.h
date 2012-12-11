//
//  WarningLightStockService.h
//  CarAssist
//
//  Created by 0witt on 25.11.12.
//  Copyright (c) 2012 0witt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface WarningLightStockService : NSObject

@property (nonatomic) NSArray* warningLights;
// Konstruktor
-(WarningLightStockService*) initWithCar:(Car *) car;
@end
