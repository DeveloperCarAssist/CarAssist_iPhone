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
                [self initGuidesForAudi];
                [self initDictionary];
                break;
            case 2:
                [self initServiceGuidesForBMW];
                [self initDictionary];
                break;
            case 3:
                [self initServiceGuidesForVWGolfIV];
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
- (void) initServiceGuidesForBMW
{
    NSMutableArray* allGuides = [NSMutableArray array];
    //NSMutableArray* steps = [NSMutableArray array];

    [allGuides addObject:[self ReserveReifenWechseln]];   
    [allGuides addObject: [self BMWOelstand]];
    [allGuides addObjectsFromArray:[self DummyGuides]];
    
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;

    
}

/**
 * Initialisiert (noch hart gecoded) die Schritt-für-Schritt-Anleitungen der Servicerubrik für das 2. Testfahrzeug
 *
 */
- (void) initServiceGuidesForVWGolfIV
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
    
    [allGuides addObjectsFromArray: [self DummyGuides]];
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
}

- (void) initGuidesForAudi
{
    NSMutableArray* allGuides = [NSMutableArray array];
    //NSMutableArray* steps = [NSMutableArray array];
    
    [allGuides addObject: [self ReserveReifenWechseln]];
    
    [allGuides addObjectsFromArray: [self DummyGuides]];
    
    self.allItems = allGuides;
    self.reducedItems = allGuides;
    
}


-(Guide*) BMWOelstand
{
   NSMutableArray* steps = [NSMutableArray array];    
    
   UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MotorHebel" ofType:@"JPG"]];
    Step* step = [[Step alloc] initWithName: @"Motorraumöffner finden" Description:@"Im Fußraum des Fahrers ist links neben dem Gaspedal der abgebildete Hebel." AndImage:image];
    [steps addObject:step];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MotorHebelbetaetigen" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Motorraumöffner betätigen" Description:@"Ziehen Sie wie abgebildet am Hebel und lösen Sie so die Sperre der Motorhaube." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Motorhaube" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Motorraum öffnen" Description:@"Drücken Sie den Hebel rein und heben Sie danach die Moterhaube an, um an den Motorraum zu kommen." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OelStandmesserOrt" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Ölstab rausziehen" Description:@"Ziehen Sie an dem roten Griff um den Ölstab zu entnehmen" AndImage:image];
    [steps addObject:step];
    
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Oelstab" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Ölstab abwischen und erneut benetzten" Description:@"Wischen Sie das Öl mit einem Tuch ab, stecken Sie den Stab wieder in die Halterung und ziehen Sie ihn erneut heraus." AndImage:image];
    [steps addObject:step];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Oelstab" ofType:@"JPG"]];
    step = [[Step alloc] initWithName: @"Ölstand ablesen" Description:@"Sie können nun den Ölstand messen. Auf dem Stab befinden sich 2 Linien: min und max. Zwischen diesen beiden Linien sollte der Ölstand liegen. Wenn das nicht der Fall ist, füllen Sie Öl nach oder lassen Sie welchen ab. Hierfür gibt es ebenfalls Anleitungen (Motoröl nachfüllen, Motoröl ablassen)." AndImage:image];
    [steps addObject:step];
    
    return [[Guide alloc] initWithName: @"Ölstand kontrollieren" CategoryName: @"Motor" AndSteps: steps];
}

-(Guide*) ReserveReifenWechseln
{
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
    
    return [[Guide alloc] initWithName: @"Reservereifen wechseln" CategoryName: @"Reifen" AndSteps: steps];

}

-(NSArray*)DummyGuides
{
    NSMutableArray* steps = [NSMutableArray array];
     NSMutableArray* allGuides = [NSMutableArray array];
    Guide* guide;
    
    guide = [[Guide alloc] initWithName: @"Motoröl nachfüllen" CategoryName: @"Motor" AndSteps: steps];
      [allGuides addObject:guide];
    guide = [[Guide alloc] initWithName: @"Motoröl ablassen" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Kühlwasser wechseln" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Überbrücken" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Batterie wechseln" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Bremsflüssigkeit prüfen" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    guide = [[Guide alloc] initWithName: @"Bremsflüssigkeit wechseln" CategoryName: @"Motor" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheibenwischwasser nachfüllen" CategoryName: @"Scheiben" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheibenwischblätter wechseln" CategoryName: @"Scheiben" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheiben reinigen" CategoryName: @"Scheiben" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Scheibe enteisen" CategoryName: @"Scheiben" AndSteps: steps];
    [allGuides addObject:guide];
    
   guide = [[Guide alloc] initWithName: @"Frontstrahler wechseln" CategoryName: @"Beleuchtung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Winterreifen wechseln" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Reifendruck Prüfen" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Reifen aufpumpen" CategoryName: @"Reifen" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Nebelschlussleuchte wechseln" CategoryName: @"Beleuchtung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Blinkerlampe wechseln" CategoryName: @"Beleuchtung" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Sitze reinigen" CategoryName: @"Innenraum" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Amaturenbrett reinigen" CategoryName: @"Innenraum" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Boden reinigen" CategoryName: @"Innenraum" AndSteps: steps];
    [allGuides addObject:guide];
    
    guide = [[Guide alloc] initWithName: @"Lüftungssystem Reinigen" CategoryName: @"Innenraum" AndSteps: steps];
    [allGuides addObject:guide];
    
    return allGuides;
}

@end
