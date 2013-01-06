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

// singleton-instance
static CarListService* instance;

- (CarListService*) init
{
    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"The Class CarListService is a singleton. You are not allowed to initialize it. Use getCarListService instead!" userInfo:nil] raise];
    return nil;
}

- (CarListService*) initInternal
{
    self = [super init];
    if (self) {
        [self initCars];
        [self initCarDictionary];
    }
    return self;
}

+ (CarListService*) getCarListService
{
    if (!instance) {
        instance = [[CarListService alloc] initInternal];
    }
    
    return instance;
    
}

- (void) initCars
{
    NSMutableArray* allCars = [NSMutableArray array];
        
    //______________________________________________________Dummy-Listen-Füllung_______________________________________________________________
    
    // Audi
    
    Car* car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"Audi";
    car.model = @"A3 8L";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"Audi";
    car.model = @"A4 B8";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"Audi";
    car.model = @"A4 B6";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"Audi";
    car.model = @"A4 B7";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"Audi";
    car.model = @"A5 S5";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"Audi";
    car.model = @"A8 D3";
    [allCars addObject:car];
    
    // VW
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"VW";
    car.model = @"Polo E36";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"VW";
    car.model = @"Golf 1 1,6";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"VW";
    car.model = @"Golf 6 2.0 TDI";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"VW";
    car.model = @"Passat W12";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.manufacturer = @"VW";
    car.model = @"Phaeton GP3";
    [allCars addObject:car];
    
    // BMW
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.model = @"330i E90";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.model = @"325i E36";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.model = @"520i E39";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.model = @"530i E60";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.model = @"745i E38";
    [allCars addObject:car];
    
    //_____________________________________________________________________________________________________________________
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    [allCars addObject:car];
    car = [[Car alloc] initWithExampleDataVWGolfIV];
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBmwZ4];
    car.model = @"316i E36";
    car.vehicalIdentNumber = @"E32TT47A3166";
    car.owner = @"Eriks Auto";
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
