//
// Diese Klasse kümmert sich darum alle verfügbaren Automodelle zur Verfügung zu Stellen
//
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface CarListService : NSObject

@property (nonatomic) NSMutableDictionary* cars;

- (void) reduceCarsWithSearchText: (NSString*) searchText;
-(Car*) returnCarByVehicalIdentNumber: (NSString*) vehicalIdentNumber;

@end