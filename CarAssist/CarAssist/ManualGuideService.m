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
        switch (car.manufacturerID)
        {//audi, bmw golf
            case 1:
                [self initServiceGuidesWithExampleDataAudi];
                [self initDictionary];
                break;
            case 2:
//TODO: Achtung: Derzeit wird mit den Daten von VW initialisiert.
// initWithExampleDataBMW bzw. initWithExampleDataBMWZ4 sind nicht vollständig!
                [self initServiceGuidesWithExampleDataVWGolfIV];
                [self initDictionary];
                break;
            case 3:
                [self initServiceGuidesWithExampleDataVWGolfIV];
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
/*
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
*/


/**
 * Initialisiert (noch hart gecoded) die Schritt-für-Schritt-Anleitungen der Servicerubrik für das 2. Testfahrzeug
 *
 */
- (void) initServiceGuidesWithExampleDataVWGolfIV
{
/*
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


    
*/
    NSMutableArray* allGuides = [NSMutableArray array];
    Step *s;
    Guide *g;
    
    // Uhrzeit einstellen
    
    NSMutableArray* steps = [NSMutableArray array];
    
    s = [[Step alloc] initWithName: @"Stunden einstellen" Description:@"Zum Einstellen der Uhrzeit ist rechts unterhalb des Drehzahlmessers ein Stellknopf angeordnet. Durch drehen gegen den Uhrzeigersinn bis zum Anschlag werden die Stunden eingestellt" AndImage:[self loadPngImage: @"golf_uhrzeit_1" ]];
    [steps addObject:s];
    
    s = [[Step alloc] initWithName: @"Minuten einstellen" Description:@"Durch drehen im Uhrzeigersinn werden die Minuten eingestell." AndImage:[self loadPngImage: @"golf_uhrzeit_2" ]];
    [steps addObject:s];
    
    
    // TOM TOM NAVI
    steps = [NSMutableArray array];
    UIImage *image;
     image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
     s = [[Step alloc] initWithName: @"Navi starten" Description:@"Drücke den Startknopf." AndImage:image];
     [steps addObject:s];
     
     image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi2" ofType:@"gif"]];
     s = [[Step alloc] initWithName: @"Navi kalibrieren" Description:@"Diesen Schritt nur ausführen, falls Sie das Navi langfristig benutzen wollen, sonst weiter mit dem nächsten Schritt.\nGeben Sie persönliche Daten ein um die Berechnungen des Navis zu optimieren." AndImage:image];
     [steps addObject:s];
     
     image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi3" ofType:@"gif"]];
     s = [[Step alloc] initWithName: @"Ziel auswählen" Description:@"Drücken Sie auf den Knopf 'Ziel eingeben' und geben Sie nun die Adresse ein, zu der Sie gelangen wollen, also Ihr Ziel." AndImage:image];
     [steps addObject:s];
     
     image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi4" ofType:@"gif"]];
     s = [[Step alloc] initWithName: @"Den Anweisungen folgen" Description:@"Folgen Sie den Anweisungen des Navis und Sie gelangen zu Ihrem Ziel." AndImage:image];
     [steps addObject:s];
     
     image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi5" ofType:@"gif"]];
     s = [[Step alloc] initWithName: @"Navi ausschalaten" Description:@"Schalten Sie das Navi aus indem Sie den 'Asuschalten'-Knopf betätigen." AndImage:image];
     [steps addObject:s];
     
     g = [[Guide alloc] initWithName: @"Navigation" CategoryName: @"Cockpit" AndSteps: steps];
     [allGuides addObject:g];
     
    

    
    g = [[Guide alloc]initWithName:@"Drehzahlmesser" CategoryName:@"Cockpit" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Uhrzeit" CategoryName:@"Cockpit" AndSteps:steps];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Kühlmitteltemperatur" CategoryName:@"Cockpit" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Kraftstoffvorat" CategoryName:@"Cockpit" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Tacho" CategoryName:@"Cockpit" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Kilometerzähler" CategoryName:@"Cockpit" AndSteps:NULL];
    [allGuides addObject:g];
    
    g = [[Guide alloc]initWithName:@"Schlüssel" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Türen" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Heckklappe" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Zentralverriegelung" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Diebstahl-Warnanlage" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Elektrische Fensterheber" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Schiebedach" CategoryName:@"Auf und zu" AndSteps:NULL];
    [allGuides addObject:g];
   
    g = [[Guide alloc]initWithName:@"Schalter" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Blinker- und Fernlicht" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Innenleuchten" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Scheibenwischer & Waschanlage" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Wischerblätter" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Rückspiegel" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Heckscheibenheizung" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Sonnenblenden" CategoryName:@"Licht und Sicht" AndSteps:NULL];
    [allGuides addObject:g];

    g = [[Guide alloc]initWithName:@"Vordersitze" CategoryName:@"Sitze" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Kopfstützen" CategoryName:@"Sitze" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Armlehne" CategoryName:@"Sitze" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Sitzheizung" CategoryName:@"Sitze" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Lenksäule" CategoryName:@"Sitze" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Hintere Sitzbank" CategoryName:@"Sitze" AndSteps:NULL];
    [allGuides addObject:g];

    g = [[Guide alloc]initWithName:@"Heizung & Belüftung" CategoryName:@"Klima" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Klimaanlage" CategoryName:@"Klima" AndSteps:NULL];
    [allGuides addObject:g];
    
    g = [[Guide alloc]initWithName:@"Schaltgetriebe" CategoryName:@"Fahren" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Handbremse" CategoryName:@"Fahren" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Zündschloss" CategoryName:@"Fahren" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Motor anlassen" CategoryName:@"Fahren" AndSteps:NULL];
    [allGuides addObject:g];
    g = [[Guide alloc]initWithName:@"Motor abstellen" CategoryName:@"Fahren" AndSteps:NULL];
    [allGuides addObject:g];
    
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
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_navi_schritt_1" ofType:@"png"]];
    step = [[Step alloc] initWithName: @"Navigation starten" Description:@"(1) Funktionstaste „NAV“ drücken. (2) Steuerungstaste „Zielführung“ drücken." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_navi_schritt_2" ofType:@"png"]];
    step = [[Step alloc] initWithName: @"Zieladresse wählen" Description:@"(3) Steuerungsknopf drehen/drücken, um das Menü „Adresse“ zu wählen/ bestätigen." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_navi_schritt_3" ofType:@"png"]];
    step = [[Step alloc] initWithName: @"Zielinformationen ergänzen" Description:@"(4) Steuerungsknopf drehen/drücken, um den Menüpunkt „Ort/PLZ“ zu wählen/ bestätigen." AndImage:image];
    [steps addObject:step];

    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_navi_schritt_4" ofType:@"png"]];
    step = [[Step alloc] initWithName: @"Autovervollständigung" Description:@"(5) Buchstaben einzeln auf die MMI touch Bedienfläche „schreiben“ bis der gewünschte Ortsname im MMI-Display angezeigt wird. (6) Um die Eingabe zu beenden und in die Liste der gefundenen Orte zu springen, kurz auf die Bedienfläche tippen." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_navi_schritt_5" ofType:@"png"]];
    step = [[Step alloc] initWithName: @"Zielwahl bestätigen" Description:@"Ort durch Drehen und Drücken auswählen und ggf. detaillierte Ziel-Informationen hinzufügen." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_navi_schritt_6" ofType:@"png"]];
    step = [[Step alloc] initWithName: @"Routenberechnung starten" Description:@"(8) Menüpunkt „Zielführung starten“ wählen. (9) Zum Bestätigen Steuerungsknopf drücken. Die Route wird berechnet." AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Navigation" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    //NAVI ende
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}
/*
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
    
    guide = [[Guide alloc] initWithName: @"Sprachstart" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"SchlüsselStart" CategoryName: @"System" AndSteps: steps];
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
    
    guide = [[Guide alloc] initWithName: @"Gepäckraum" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Tanken" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Warndreieck" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Reservereifen" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Seitenspiegel anpassen" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Radio" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Motorraumklappenentriegelung" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Lenkradeinstellung" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Memoryfunktion" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Türgriffe" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Zentralverriegelungsschalter" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Lichtschalter" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Geschwindigkeitsregelanlage" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Zigarettenanzünder" CategoryName: @"Ausstattung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Anfahrassistent" CategoryName: @"Ausstattung" AndSteps: steps];
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
    
    guide = [[Guide alloc] initWithName: @"Navi einstellen" CategoryName: @"Ausstatung" AndSteps: steps];
    [allGuides addObject:guide];
    
    //NAVI ende
    
    //Eine Anleitung für noch etwas
    //TODO, BILDER
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Motorstop.1" Description:@"Fahrzeug bis zum Stillstand abbremsen und in den Leerlauf schalten.. " AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Motorstop.2" Description:@"Kupplung loslassen, Motor wird automatisch abgestellt..." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Motorstop.3" Description:@"die Kontrollleuchte 'A' leuchtet." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Motorstart.1" Description:@"Vor Weiterfahrt Kupplung treten, Motor startet selbstständig..." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"navi1" ofType:@"gif"]];
    step = [[Step alloc] initWithName: @"Motorstart.2" Description:@"die Kontrollleuchte erlischt. Ersten Gang einlegen und weiterfahren." AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Start-Stop-System" CategoryName: @"System" AndSteps: steps];
    [allGuides addObject:guide];
    //Anleitung für noch etwas ende
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}
 
 */

-(UIImage *) loadPngImage:(NSString*)name
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];
}

@end
