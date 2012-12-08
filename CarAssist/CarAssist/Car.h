//
//  Auto.h
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property NSString *modell, *producer, *radio, *navigation, *seatHeater, *name;
// Initiallisiert ein Auto mit Beispiel Daten
-(Car*) initWithExampleData;
// Initiallisieren ein Leer Auto ohne zusatz
-(Car*) initNewCar;

@end
