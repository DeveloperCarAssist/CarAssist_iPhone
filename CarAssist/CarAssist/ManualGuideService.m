//
//  ManualGuideStockService.m
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ManualGuideService.h"

@implementation ManualGuideService

//
//  Service für ein spezifisches Fahrzeug initialisieren
//  TODO: Testdaten nicht mehr hart codieren sondern aus einer
//  Datenquelle laden
//
-(SearchableGuideService*) initWithCar:(Car *) car
{
    self = [super initWithCar:car];
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
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AutoSitz" ofType:@"jpg"]];
    Step* step = [[Step alloc] initWithName: @"Sitz in Längsrichtung einstellen(1)" Description:@"Hebel hochziehen und Sitz verschieben. Dann Hebel loslassen und Sitz weiter verschieben, bis die Verriegelung einrastet." AndImage:image];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Lehne entriegeln(2)" Description:@"(nur 2-türige Fahrzeuge) Hebel nach oben ziehen und Lehne vorklappen." AndImage:image];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"\"Easy-Entry\"(2)" Description:@"(nur 2-türige Fahrzeuge) Diese Funktion erleichtert Ihnen das Einsteigen nach hinten. Ziehen Sie diesen Hebel nach oben und klappen Sie die Lehne nach vorn. Gleichzeitig hebt sich die Sitzfläche etwas und bewegt sich ebenfalls nach vorne." AndImage:image ];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Lendenwirbelstütze* einstellen(3)" Description:@"Durh Drehen des Handrades läßt sich die Polsterpartie im Lendenwirbelbereich mehr oder weniger auswölben. Dadurch wird de natürliche Krümmung der Wirbelsäule besonders wirksam unterstützt, so daß die Sitzhaltung vor allem auf langen Strecken ermüdungsfreier wird." AndImage:image ];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Lehneneignung einstellen(4)" Description:@"Lehne entlasten und Handrad drehen." AndImage:image ];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Sitzhöhe* einstellen(5)" Description:@"Durch \"Pumpbewegungen\" des Hebels an der Sitzaußenseite läßt sch der Sitz parallel anheben und absenken." AndImage:image ];
    [steps addObject:step];
    
    Guide* guide = [[Guide alloc] initWithName: @"Autositz einstellen" CategoryName: @"Sitze" AndSteps: steps];
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
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AutoSitz" ofType:@"jpg"]];
    Step* step = [[Step alloc] initWithName: @"Sitz in Längsrichtung einstellen(1)" Description:@"Hebel hochziehen und Sitz verschieben. Dann Hebel loslassen und Sitz weiter verschieben, bis die Verriegelung einrastet." AndImage:image];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Lehne entriegeln(2)" Description:@"(nur 2-türige Fahrzeuge) Hebel nach oben ziehen und Lehne vorklappen." AndImage:image];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"\"Easy-Entry\"(2)" Description:@"(nur 2-türige Fahrzeuge) Diese Funktion erleichtert Ihnen das Einsteigen nach hinten. Ziehen Sie diesen Hebel nach oben und klappen Sie die Lehne nach vorn. Gleichzeitig hebt sich die Sitzfläche etwas und bewegt sich ebenfalls nach vorne." AndImage:image ];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Lendenwirbelstütze* einstellen(3)" Description:@"Durh Drehen des Handrades läßt sich die Polsterpartie im Lendenwirbelbereich mehr oder weniger auswölben. Dadurch wird de natürliche Krümmung der Wirbelsäule besonders wirksam unterstützt, so daß die Sitzhaltung vor allem auf langen Strecken ermüdungsfreier wird." AndImage:image ];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Lehneneignung einstellen(4)" Description:@"Lehne entlasten und Handrad drehen." AndImage:image ];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Sitzhöhe* einstellen(5)" Description:@"Durch \"Pumpbewegungen\" des Hebels an der Sitzaußenseite läßt sch der Sitz parallel anheben und absenken." AndImage:image ];
    [steps addObject:step];
    
    Guide* guide = [[Guide alloc] initWithName: @"Autositz einstellen" CategoryName: @"Sitze" AndSteps: steps];
    [allGuides addObject:guide];
    

    
    //---------------------------------------------------------------------------------------------------------------------------------------
    
     steps = [NSMutableArray array];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AutoSitz" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Höhe einstellen" Description:@"Lorem Ipsum" AndImage:image];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Aus und einbauen" Description:@"Dolor sit." AndImage:image];
    [steps addObject:step];
    
    
    guide = [[Guide alloc] initWithName: @"Kopfstützen" CategoryName: @"Sitze" AndSteps: steps];
    [allGuides addObject:guide];
    //---------------------------------------------------------------------------------------------------------------------------------------
    
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
    
    step = [[Step alloc] initWithName: @"Drehschalter B - Gebläse" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];    

    step = [[Step alloc] initWithName: @"Drehregler C- Luftverteilung" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Heizung und Lüftung" CategoryName: @"Klima" AndSteps: steps];
    [allGuides addObject:guide];
    
    
    
    self.allGuides = allGuides;
    self.reducedGuides = allGuides;
}


@end