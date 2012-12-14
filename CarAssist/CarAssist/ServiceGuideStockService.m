//
//  ServiceGuideStockService.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceGuideStockService.h"
#import "Step.h"
#import "Guide.h"
#import "NSString+CarAssistString.h"

@interface ServiceGuideStockService ()

@property (nonatomic) NSArray* allGuides;
@property (nonatomic) NSArray* reducedGuides;

@end

@implementation ServiceGuideStockService
// Property guides stammt aus Protocol und muss deshalb synthetisiert werden!
@synthesize guides = _guides;

//
//  Service leer initialisieren
//
- (ServiceGuideStockService*) init
{
    self = [super init];
    
    if (self)
    {
        NSMutableArray* allGuides = [NSMutableArray array];
        self.allGuides = allGuides;
        self.reducedGuides = allGuides;
        
        [self initGuideDictionary];
    }
    
    return self;
}
//
//  Service für ein spezifisches Fahrzeug initialisieren
//  TODO: Testdaten nicht mehr hart codieren sondern aus einer
//  Datenquelle laden
//
-(ServiceGuideStockService*) initWithCar:(Car *) car
{
    self = [super init];
    if(self)
    {
        switch (car.unid)
        {
            case 1:
                [self initServiceGuidesWithExampleDataBmwZ4];
                [self initGuideDictionary];
                break;
            case 2:
                [self initServiceGuidesWithExampleDataVWGolfIV];
                [self initGuideDictionary];
                break;
            default:
                @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"no service data for selected car" userInfo:nil];
                break;
        }
    }
    return self;
}

/**
 * Initialisiert (noch hart gecoded) die Schritt-für-Schritt-Anleitungen der Servicerubrik für das 1. Testfahrzeug
 *
 */
- (void) initServiceGuidesWithExampleDataBmwZ4
{
    NSMutableArray* allGuides = [NSMutableArray array];
    NSMutableArray* steps = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifenwechsel_schritt_10" ofType:@"jpeg"]];
    Step* step = [[Step alloc] initWithName: @"Radmuttern lösen" Description:@"Verwenden Sie das Radkreuz zum Lösen der Radmuttern. Wechseln Sie nur einen Reifen zur Zeit. Um mehr Kraft aufzuwenden, verwenden Sie Ihren Fuß als Hebel. Lösen Sie die Radmuttern nur leicht an." AndImage:image];
    [steps addObject:step];
    /* alter Text
     "Als ersten sollten sie den Reservereifen holen.\n Dazu begeben Sie sich bitte zu Ihrem Kofferaum und öffnen diesen.\n Räumen Sie den Kofferaum leer.\n Unter der Abdeckung finden Sie Ihren Reservereifen und einen Schlüssel zum lösen der Radmuttern. Gegebenenfalls ist auch ein Felgenschloss dabei.\n Nehmen Sie den Reservereifen aus der Vertiefung."
    */
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifenwechsel_schritt_20" ofType:@"jpeg"]];
    step = [[Step alloc] initWithName: @"Wagenheber ansetzen" Description:@"Setzen Sie den Wagenheber an der Karosserie markierten Stelle an. Heben Sie den Wagen nur leicht an, bis das Rad knapp über dem Boden schwebt." AndImage:image];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Info" Description:@"In dieser Anleitung befinden sich Texte für den BMW." AndImage:nil ];
    [steps addObject:step];
    
    /* alter Text
     Als erstes müssen Sie die das Auto aufbocken. Dann lösen Sie die Radmuttern des alten Reifens und nehmen den Reifen ab (Legen Sie den Reifen am besten in de Kofferaum, damit Sie ihn nicht vergessen). Jetzt nur noch den Reservereifen wieder anschrauben! Fahren Sie nicht zu schnell. Der Reservereifen ist nur für Geschwindigkeiten bis 90 Kilometer pro String ausgelegt!
     */
    
    
    Guide* guide = [[Guide alloc] initWithName: @"Reservereifen montieren" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    //---------------------------------------------------------------------------------------------------------------------------------------
    
    steps = [NSMutableArray array];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kuehlwasser" ofType:@"jpg"]];
    
    step = [[Step alloc] initWithName: @"Schritt 1: Kühlwassser kaufen" Description:@"Als ersten sollten sie den Reservereifen holen.\n Dazu begeben Sie sich bitte zu Ihrem Kofferaum und öffnen diesen.\n Räumen Sie den Kofferaum leer.\n Unter der Abdeckung finden Sie Ihren Reservereifen und einen Schlüssel zum lösen der Radmuttern. Gegebenenfalls ist auch ein Felgenschloss dabei.\n Nehmen Sie den Reservereifen aus der Vertiefung." AndImage:image];
    [steps addObject:step];
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nachfuellen" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Schritt 2: Kühlwasser nachfüllen" Description:@"Als erstes müssen Sie die das Auto aufbocken. Dann lösen Sie die Radmuttern des alten Reifens und nehmen den Reifen ab (Legen Sie den Reifen am besten in de Kofferaum, damit Sie ihn nicht vergessen). Jetzt nur noch den Reservereifen wieder anschrauben! Fahren Sie nicht zu schnell. Der Reservereifen ist nur für Geschwindigkeiten bis 90 Kilometer pro String ausgelegt!" AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Kühlwasser nachfüllen" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    
    
    //---------------------------------------------------------------------------------------------------------------------------------------
    
    steps = [NSMutableArray array];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kuehlwasser" ofType:@"jpg"]];
    
    step = [[Step alloc] initWithName: @"Schritt 1: Kühlwassser kaufen" Description:@"Als ersten sollten sie den Reservereifen holen.\n Dazu begeben Sie sich bitte zu Ihrem Kofferaum und öffnen diesen.\n Räumen Sie den Kofferaum leer.\n Unter der Abdeckung finden Sie Ihren Reservereifen und einen Schlüssel zum lösen der Radmuttern. Gegebenenfalls ist auch ein Felgenschloss dabei.\n Nehmen Sie den Reservereifen aus der Vertiefung." AndImage:image];
    [steps addObject:step];
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nachfuellen" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Schritt 2: Kühlwasser nachfüllen" Description:@"Als erstes müssen Sie die das Auto aufbocken. Dann lösen Sie die Radmuttern des alten Reifens und nehmen den Reifen ab (Legen Sie den Reifen am besten in de Kofferaum, damit Sie ihn nicht vergessen). Jetzt nur noch den Reservereifen wieder anschrauben! Fahren Sie nicht zu schnell. Der Reservereifen ist nur für Geschwindigkeiten bis 90 Kilometer pro String ausgelegt!" AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Ölstand kontrollieren" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    self.allGuides = allGuides;
    self.reducedGuides = allGuides;
}

/**
 * Initialisiert (noch hart gecoded) die Schritt-für-Schritt-Anleitungen der Servicerubrik für das 2. Testfahrzeug
 *
 */
- (void) initServiceGuidesWithExampleDataVWGolfIV
{
    NSMutableArray* allGuides = [NSMutableArray array];
    NSMutableArray* steps = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifenwechsel_schritt_10" ofType:@"jpeg"]];
    Step* step = [[Step alloc] initWithName: @"Radmuttern lösen" Description:@"Verwenden Sie das Radkreuz zum Lösen der Radmuttern. Wechseln Sie nur einen Reifen zur Zeit. Um mehr Kraft aufzuwenden, verwenden Sie Ihren Fuß als Hebel. Lösen Sie die Radmuttern nur leicht an." AndImage:image];
    [steps addObject:step];

    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifenwechsel_schritt_20" ofType:@"jpeg"]];
    step = [[Step alloc] initWithName: @"Wagenheber ansetzen" Description:@"Setzen Sie den Wagenheber an der Karosserie markierten Stelle an. Heben Sie den Wagen nur leicht an, bis das Rad knapp über dem Boden schwebt." AndImage:image];
    [steps addObject:step];

    step = [[Step alloc] initWithName: @"Info" Description:@"In dieser Anleitung befinden sich Texte für den Golf." AndImage:nil ];
    [steps addObject:step];
    
    Guide* guide = [[Guide alloc] initWithName: @"Reservereifen montieren" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    self.allGuides = allGuides;
    self.reducedGuides = allGuides;
}


/**
 * Initialisiert das Dictionary mit den Anleitungen.
 *
 */
- (void) initGuideDictionary
{
    self.guides = [NSMutableDictionary dictionary];
    NSMutableSet* serviceCategories = [NSMutableArray array];
    
    // Alle keys holen (Kategorien)
    for (Guide* guide in self.reducedGuides) {
        [serviceCategories addObject: guide.categoryName];
    }
    
    // Keys (Kategorien) mappen auf leere Liste.
    for (NSString* categoryName in serviceCategories) {
        NSMutableArray* guidesOfCategory = [NSMutableArray array];
        [self.guides setObject:guidesOfCategory forKey:categoryName];
    }
    
    // Liste der Kategorien mit entsprechenden Anleitungen füllen.
    for (Guide* guide in self.reducedGuides) {
        NSMutableArray* guidesOfCategory = [self.guides objectForKey:guide.categoryName];
        [guidesOfCategory addObject:guide];
    }
}


- (void) reduceReducedGuidesWithSearchText: (NSString*) searchText
{
    NSMutableArray* guides = [NSMutableArray array];
    
    if (![searchText isEqualToString:@""])
    {
        for (Guide* guide in self.reducedGuides) {
            if ([guide.name containsSubstring:searchText] || [guide.categoryName containsSubstring:searchText]) {
                [guides addObject:guide];
            }
        }
        
        self.reducedGuides = guides;
    }
}



/**
 * Aktualisiert das Dictionary, so dass nur Anleitungen enthalten sind, in denen der searchText enthalten ist. Mit Leerzeichen getrennte Worte werden als 2 verschiedene Suchbegriffe aufgefasst.
 *
 */
- (void) reduceGuidesWithSearchText: (NSString*) searchText
{
    NSArray* searchItems = [searchText componentsSeparatedByString:@" "];
    
    self.reducedGuides = self.allGuides;
    
    for (NSString* searchItem in searchItems) {
        [self reduceReducedGuidesWithSearchText: searchItem];
    }
    
    [self initGuideDictionary];
}






@end
