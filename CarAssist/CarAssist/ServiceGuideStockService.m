//
//  ServiceGuideStockService.m
//  CarAssist
//
//  Created by Dennis on 15.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceGuideStockService.h"
#import "Guide.h"
#import "Step.h"

@implementation ServiceGuideStockService
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
                //      [self initServiceGuidesWithExampleDataAudi];
                [self initGuidesForUXTest];
                [self initDictionary];
                break;
            case 2:
                [self initServiceGuidesWithExampleDataBMW];
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
- (void) initServiceGuidesWithExampleDataBMW
{
    NSMutableArray* allGuides = [NSMutableArray array];
    NSMutableArray* steps = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifenwechsel_schritt_10" ofType:@"jpeg"]];
    Step* step = [[Step alloc] initWithName: @"Reifenwechel" Description:@"Sie benötigen: \n Radkreuz \n Wagenheber \n" AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifenwechsel_schritt_10" ofType:@"jpeg"]];
    step = [[Step alloc] initWithName: @"Radmuttern lösen" Description:@"Verwenden Sie das Radkreuz zum Lösen der Radmuttern. Wechseln Sie nur einen Reifen zur Zeit. Um mehr Kraft aufzuwenden, verwenden Sie Ihren Fuß als Hebel. Lösen Sie die Radmuttern nur leicht an." AndImage:image];
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
    
    step = [[Step alloc] initWithName: @"Kühlwassser kaufen" Description:@"Als ersten sollten sie den Reservereifen holen.\n Dazu begeben Sie sich bitte zu Ihrem Kofferaum und öffnen diesen.\n Räumen Sie den Kofferaum leer.\n Unter der Abdeckung finden Sie Ihren Reservereifen und einen Schlüssel zum lösen der Radmuttern. Gegebenenfalls ist auch ein Felgenschloss dabei.\n Nehmen Sie den Reservereifen aus der Vertiefung." AndImage:image];
    [steps addObject:step];
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nachfuellen" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Kühlwasser nachfüllen" Description:@"Als erstes müssen Sie die das Auto aufbocken. Dann lösen Sie die Radmuttern des alten Reifens und nehmen den Reifen ab (Legen Sie den Reifen am besten in de Kofferaum, damit Sie ihn nicht vergessen). Jetzt nur noch den Reservereifen wieder anschrauben! Fahren Sie nicht zu schnell. Der Reservereifen ist nur für Geschwindigkeiten bis 90 Kilometer pro String ausgelegt!" AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Kühlwasser kontrollieren" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
    
    
    //------------------- BMW Ölstand echte anleitung ----
    
    steps = [NSMutableArray array];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MotorHebel" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Motorraumöffner finden" Description:@"Bei dem Gaspedalen links ist der abgebildete Hebel." AndImage:image];
    [steps addObject:step];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MotorHebelbetaetigen" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Motorraumöffner betätigen" Description:@"Bei dem Gaspedalen links ist der abgebildete Hebel." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Motorhaube" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Motorraum öffnen" Description:@"Drücken Sie den Hebel rein und heben sie danach die Moterhaube" AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OelStandmesserOrt" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Ölstab rausziehen" Description:@"Ziehen sie an dem roten Ring um den Ölstab raus zu ziehen" AndImage:image];
    [steps addObject:step];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Oelstab" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Ölstab abwischen und erneut benetzten" Description:@"Wischen sie die Oelreste mit einem Taschentuch, stecken sie den Stab wieder in die Halterung und ziehen sie ihn erneut raus" AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Oelstab" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Ölstab ablesen" Description:@"Sie können nun die Ölstand messen. Auf dem Stab befindet sich 2 Linien, min und max. Zwischen diesen beiden sollte der Ölstand liegen." AndImage:image];
    [steps addObject:step];
    
    guide = [[Guide alloc] initWithName: @"Ölstand kontrollieren" CategoryName: @"Motor" AndSteps: steps];
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
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}

- (void) initGuidesForUXTest
{
    NSMutableArray* allGuides = [NSMutableArray array];
    NSMutableArray* steps = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"used" ofType:@"jpg"]];
    Step* step = [[Step alloc] initWithName: @"Was Sie brauchen" Description:@"Sie benötigen (v.l.n.r) Reservereifen, Wagenkreuz, Kreutz-Schraubenzieher, Felgenschloss, Wagenheber und optional einen Drehmomentschlüssel. Diese Dinge sollten Sie unter der Kofferaum abdeckung finden." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abdeckung" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Reservereifen abmontieren" Description:@"Folgen Sie der Anleitung auf der Kofferaumabdeckung, um den Reservereifen abzumontieren." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"felgenschloss" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Felgenschloss benutzen" Description:@"Ziehen Sie die Kappe von der Radmutter und stecken Sie das Felgenschloss auf." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loesen" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Radmuttern lösen" Description:@"Lösen Sie nun alle 5 Radmuttern soweit, bis diese per Hand drehbar sind. Drehen Sie gegen den Uhrzeigersinn. Bitte nicht ganz abschrauben! Nutzen Sie dafür das Wagenkreuz. Sie können auch den Fuß zur hilfe nehmen." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kappe" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Wagenheber vorbereiten" Description:@"Entfernen Sie mit dem Schraubenzieher (gegen den Uhrzeigersinn) die Kappe neben dem Radkasten." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"heben" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Wagenheber einführen" Description:@"Führen Sie den Wagenheber komplett in die Öffnung ein und kurbeln Sie im Ihrzeigersinn, bis das Rad mindestens 2cm in der Luft hängt." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"radab" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Rad abnehmen" Description:@"Schrauben Sie nun die Muttern komplett ab und nehmen Sie das Rad ab. Beim Abnehmen des Rades kann etwas Kraf von Nöten sein." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"radan" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Reserverad einsetzen" Description:@"Setzen Sie nun das Reserverad so auf, dass die Löcher im Rad auf die Gewinde passen." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"andrehen" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Radmuttern andrehen" Description:@"Drehen Sie nun die Radmuttern an. Benutzen Sie soweit es geht die Hände und drehen dann noch ein Mal mit sehr wenig Kraft mit dem Wagenkreuz nach." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"senken" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Wagen absenken" Description:@"Senken Sie nun den Wagen ab, indem Sie am Wagenheben gegen den Uhrzeigersinn drehen. Entfernen Sie danach den Wagenheben und stecken die Kappe wieder in die Aussparung." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fest" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Radmuttern festziehen" Description:@"Ziehen Sie nun die Radmuttern mit dem Wagenkreuz fest, wenden Sie Kraft aus aber übertreiben Sie es nicht. Mit dem optionalen Drehmomentschlüssel können Sie die Muttern mit 10 Nm festdrehen." AndImage:image ];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"halleluja" ofType:@"jpg"]];
    step = [[Step alloc] initWithName: @"Gute Fahrt" Description:@"Fahren Sie mit dem Reservereifen nicht über 80 kmh und suchen Sie schnellstmöglich eine Werkstatt auf. Ihr CarAssist Team wünscht eine gute Fahrt!" AndImage:image ];
    [steps addObject:step];
    
    Guide* guide = [[Guide alloc] initWithName: @"Reservereifen wechseln" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    
    
    // ____________________________________________________Dummy-Guides-to-fill-List______________________________________________________________________________________
    
    
    steps = [NSMutableArray array];

    guide = [[Guide alloc] initWithName: @"Ölstand messen" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Kühlwasser wechseln" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Motor tauschen" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Überbrücken" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Scheibenwischwasser nachfüllen" CategoryName: @"Scheiben" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Scheibenwischblätter wechseln" CategoryName: @"Scheiben" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Scheibe säubern" CategoryName: @"Scheibe" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Scheibe enteisen" CategoryName: @"Scheibe" AndSteps: steps];
    [allGuides addObject:guide];

    guide = [[Guide alloc] initWithName: @"Lampe wechseln" CategoryName: @"Beleuchtung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Winterreifen wechseln" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Reifen aufpumpen" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];

    
    // ____________________________________________________Dummy-Guides-to-fill-List______________________________________________________________________________________
    
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
    
}


@end
