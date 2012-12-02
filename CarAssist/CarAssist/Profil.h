//
//  Profil.h
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Profil : NSObject
@property (strong) NSString *vorname, *nachname,*emailAdresse,*lieblingsKEKSEEE;
@property NSMutableArray *carList;
@property Car *car;
// Erstellt ein Profil mit Beispiel Daten
-(Profil*) initWithExampleData;

@end
