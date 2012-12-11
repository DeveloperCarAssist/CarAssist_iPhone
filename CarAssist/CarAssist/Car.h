//
//  Auto.h
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property NSString *model, *manufacturer, *radio, *navigation, *seatHeater, *owner;
@property NSInteger unid;
// Initiallisiert Autos mit Beispieldaten
-(Car*) initWithExampleDataBmwZ4;
-(Car*) initWithExampleDataVWGolfIV;
// Initiallisiert ein leeres Auto ohne Zusatz
-(Car*) initNewCar;

@end
