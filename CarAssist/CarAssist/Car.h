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
// Initiallisiert Autos mit Beispiel Daten
-(Car*) initWithExampleDataBmwZ4;
-(Car*) initWithExampleDataVWGolfIV;
// Initiallisieren ein Leer Auto ohne zusatz
-(Car*) initNewCar;

@end
