//
// Diese Klasse kümmert sich darum alle verfügbaren Automodelle zur Verfügung zu Stellen
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarListService.h"
#import "Car.h"
#import "NSString+CarAssistString.h"

@interface CarListService()

@property NSMutableArray *producerlist;
@property NSMutableDictionary *modelList;


@property (nonatomic) NSArray* allCars;
//Liste für Suche
@property (nonatomic) NSArray* reducedCars;


@end
@implementation CarListService

- (CarListService*) init
{
    self = [super init];
    if (self) {
        [self initCars];
        [self initCarDictionary];
    }
    return self;
}

- (void) initCars
{
    NSMutableArray* allCars = [NSMutableArray array];
    
    Car* car = [[Car alloc] initWithExampleDataBmwZ4];
    [allCars addObject:car];
    car = [[Car alloc] initWithExampleDataVWGolfIV];
    [allCars addObject:car];
    
    self.allCars = allCars;
    self.reducedCars = allCars;
}

/**
 * Initialisiert das Dictionary mit den Autos.
 *
 */
- (void) initCarDictionary
{
    self.cars = [NSMutableDictionary dictionary];
    NSMutableSet* carProducers = [NSMutableArray array];
    
    // Alle keys holen (Hersteller)
    for (Car* car in self.reducedCars) {
        [carProducers addObject: car.manufacturer];
    }
    
    // Keys (Hersteller) mappen auf leere Liste.
    for (NSString* producer in carProducers) {
        NSMutableArray* carsFromProducer = [NSMutableArray array];
        [self.cars setObject:carsFromProducer forKey:producer];
    }
    
    // Liste der Hersteller mit entsprechenden Autos füllen.
    for (Car* car in self.reducedCars) {
        NSMutableArray* carsFromProducer = [self.cars objectForKey:car.manufacturer];
        [carsFromProducer addObject:car];
    }
}


- (void) reduceReducedCarsWithSearchText: (NSString*) searchText
{
    NSMutableArray* cars = [NSMutableArray array];
    
    if (![searchText isEqualToString:@""])
    {
        for (Car* car in self.reducedCars) {
            if ([car.model containsSubstring:searchText] || [car.manufacturer containsSubstring:searchText]) {
                [cars addObject:car];
            }
        }
        
        self.reducedCars = cars;
    }
    
}
/**
 * Diese Methode kriegt eine Fahrgestellnummer und liefer das dazugehörige Auto.
 */
-(Car*) returnCarByVehicalIdentNumber: (NSString*) vehicalIdentNumber
{
    if (vehicalIdentNumber.length >=8)
    {
        for (int i = 0 ; i < self.allCars.count; i++)
        {
        Car* automobil = [self.allCars objectAtIndex: i];
        if ( [[automobil.vehicalIdentNumber substringToIndex:8] isEqual: [vehicalIdentNumber substringToIndex:8]])
        {
            return automobil;
        }
    }
}
    return nil;
}

/**
 * Aktualisiert das Dictionary, so dass nur Autos enthalten sind, deren Hersteller oder Name den searchText enthalten.
 */
- (void) reduceCarsWithSearchText: (NSString*) searchText

{
    NSArray* searchItems = [searchText componentsSeparatedByString:@" "];
    
    self.reducedCars = self.allCars;
    
    for (NSString* searchItem in searchItems) {
        [self reduceReducedCarsWithSearchText: searchItem];
    }
    
    [self initCarDictionary];
}



@end
