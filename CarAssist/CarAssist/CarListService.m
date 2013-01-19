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
    
    Car* car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"A1 Sportback";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"A3 Cabriolet";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"A4 allroad quattro";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"A4 Avant";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017634";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"RS4 Avant";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"A6 hybrid";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"S6 Limousine";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"S7 Limousine";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"S8";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"TT RS Roadstar";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"Q7";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataAudi];
    car.model = @"R8 Coupé";
    car.vehicalIdentNumber = @"WAUZZZ8X5DB017631";
    [allCars addObject:car];


    // VW
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Polo";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Golf Plus";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Golf Variant";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Golf GTI";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Scirocco";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Jetta";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Touran";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Tiguan";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Passat";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Touareg";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Phaeton";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataVW];
    car.model = @"Caddy";
    car.vehicalIdentNumber = @"WBADU276";
    [allCars addObject:car];
    
    // BMW
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"316i E36";
    car.vehicalIdentNumber = @"E32TT47A3166";
    car.owner = @"Eriks Auto";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW 1er Coupé";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW M3 Coupé";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW 3er Cabrio";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW ActiveHybrid 3";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW 6er Coupé";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW M6 Gran Coupé";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW X1";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW Z4 Roadstar";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW X6 M";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW M5 Limousine";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    car = [[Car alloc] initWithExampleDataBMW];
    car.model = @"BMW M6 Cabrio";
    car.vehicalIdentNumber = @"WBAUC11030VM01040";
    [allCars addObject:car];
    
    //_____________________________________________________________________________________________________________________
    
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
-(Car*) returnCarByVehicleIdentNumber: (NSString*) vehicleIdentNumber
{
    if (vehicleIdentNumber.length >=8)
    {
        for (int i = 0 ; i < self.allCars.count; i++)
        {
        Car* automobil = [self.allCars objectAtIndex: i];
        if ( [[automobil.vehicalIdentNumber substringToIndex:8] isEqual: [vehicleIdentNumber substringToIndex:8]])
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
