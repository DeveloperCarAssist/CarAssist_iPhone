//
//  Auto.h
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarEquipmentPackage.h"
#import "AuthorizedRepair.h"

@interface Car : NSObject
@property (nonatomic) NSString *model, *manufacturer, *owner, *gearbox, *insurance, *vehicalIdentNumber;
@property (nonatomic) AuthorizedRepair* garage;
@property (nonatomic) CarEquipmentPackage* equipmentPackage;
@property (nonatomic) NSInteger unid;
@property (nonatomic) NSInteger manufacturerID;
// Initiallisiert entweder BMWs, Audis, oder VWs mit Standarddaten
-(Car*) initWithExampleDataBMW;
-(Car*) initWithExampleDataVW;
-(Car*) initWithExampleDataAudi;
// Initiallisiert ein leeres Auto ohne Zusatz
-(Car*) initNewCar;

@end
