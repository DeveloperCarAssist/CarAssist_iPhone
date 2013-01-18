//
//  ManualGuideStockService.m
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ManualGuideService.h"
#import "Guide.h"
#import "Step.h"

@implementation ManualGuideService

//
//  Service für ein spezifisches Fahrzeug initialisieren
//  TODO: Testdaten nicht mehr hart codieren sondern aus einer
//  Datenquelle laden
//
-(SearchableService*) initWithCar:(Car *) car
{
    self = [super initWithCar:car];
    if(self)
    {
        switch (car.unid)
        {
            case 1:
                [self initServiceGuidesWithExampleDataBmwZ4];
                [self initDictionary];
                break;
            case 2:
                [self initServiceGuidesWithExampleDataVWGolfIV];
                [self initDictionary];
                break;
            case 3:
                [self initServiceGuidesWithExampleDataAudi];
                [self initDictionary];
                break;
            case 4:
                [self initServiceGuidesWithExampleDataBMW];
                [self initDictionary];
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
    
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
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

    step = [[Step alloc] initWithName: @"Drehregler A - Temperatur" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Drehschalter B - Gebläse" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];    

    step = [[Step alloc] initWithName: @"Drehregler C- Luftverteilung" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Heizung und Lüftung" CategoryName: @"Klima" AndSteps: steps];
    [allGuides addObject:guide];
    
    //---------------------------------------------------------------------------------------------------------------------------------------

    
    steps = [NSMutableArray array];    
    
    guide = [[Guide alloc] initWithName: @"Auto starten" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheibenwischer" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Blinker" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Autofenster" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Handbremse" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Schaltknüppel" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Airbag" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Lagerraum" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Tanken" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}

- (void) initServiceGuidesWithExampleDataAudi
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
    
    step = [[Step alloc] initWithName: @"Drehregler A - Temperatur" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Drehschalter B - Gebläse" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Drehregler C- Luftverteilung" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Heizung und Lüftung" CategoryName: @"Klima" AndSteps: steps];
    [allGuides addObject:guide];
    
    //---------------------------------------------------------------------------------------------------------------------------------------
    
    
    steps = [NSMutableArray array];
    
    guide = [[Guide alloc] initWithName: @"Auto starten" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheibenwischer" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Blinker" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Autofenster" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Handbremse" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Schaltknüppel" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Airbag" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Lagerraum" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Tanken" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    
    //NAVI
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Navi starten" Description:@"Drücke den Startknopf." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi2" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Navi kalibrieren" Description:@"Diesen Schritt nur ausführen, falls Sie das Navi langfristig benutzen wollen, sonst weiter mit dem nächsten Schritt.\nGeben Sie persönliche Daten ein um die Berechnungen des Navis zu optimieren." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi3" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Ziel auswählen" Description:@"Drücken Sie auf den Knopf 'Ziel eingeben' und geben Sie nun die Adresse ein, zu der Sie gelangen wollen, also Ihr Ziel." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi4" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Den Anweisungen folgen" Description:@"Folgen Sie den Anweisungen des Navis und Sie gelangen zu Ihrem Ziel." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi5" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Navi ausschalaten" Description:@"Schalten Sie das Navi aus indem Sie den 'Asuschalten'-Knopf betätigen." AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Navi einstellen" CategoryName: @"Extras" AndSteps: steps];
    [allGuides addObject:guide];
    
    //NAVI ende
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}

- (void) initServiceGuidesWithExampleDataBMW
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
    
    step = [[Step alloc] initWithName: @"Drehregler A - Temperatur" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Drehschalter B - Gebläse" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    step = [[Step alloc] initWithName: @"Drehregler C- Luftverteilung" Description:@"Dolor sit." AndImage:nil];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Heizung und Lüftung" CategoryName: @"Klima" AndSteps: steps];
    [allGuides addObject:guide];
    
    //---------------------------------------------------------------------------------------------------------------------------------------
    
    
    steps = [NSMutableArray array];
    
    guide = [[Guide alloc] initWithName: @"Auto starten" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheibenwischer" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Blinker" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Autofenster" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Handbremse" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Schaltknüppel" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Airbag" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Lagerraum" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Tanken" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    //NAVI
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Navi starten" Description:@"Drücke den Startknopf." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi2" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Navi kalibrieren" Description:@"Diesen Schritt nur ausführen, falls Sie das Navi langfristig benutzen wollen, sonst weiter mit dem nächsten Schritt.\nGeben Sie persönliche Daten ein um die Berechnungen des Navis zu optimieren." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi3" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Ziel auswählen" Description:@"Drücken Sie auf den Knopf 'Ziel eingeben' und geben Sie nun die Adresse ein, zu der Sie gelangen wollen, also Ihr Ziel." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi4" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Den Anweisungen folgen" Description:@"Folgen Sie den Anweisungen des Navis und Sie gelangen zu Ihrem Ziel." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi5" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Navi ausschalaten" Description:@"Schalten Sie das Navi aus indem Sie den 'Asuschalten'-Knopf betätigen." AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Navi einstellen" CategoryName: @"Extras" AndSteps: steps];
    [allGuides addObject:guide];
    
    //NAVI ende
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}


@end
