//
//  WarningLightStockService.m
//  CarAssist
//
//  Created by 0witt on 25.11.12.
//  Copyright (c) 2012 0witt. All rights reserved.
//

#import "WarningLight.h"
#import "WarningLightStockService.h"

@implementation WarningLightStockService

-(WarningLightStockService*) initWithCar:(Car *) car
{
    self = [super init];
    if (self)
    {
        [self initWarningLights];
    }
    
    return self;
}

-(void) initWarningLights
{
    NSMutableArray* warningLights = [NSMutableArray array];
    
    UIImage* image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bremsanlage" ofType:@"png"]];
    WarningLight* warningLight = [[WarningLight alloc] initWithName:@"Bremsanlage" Info:@"Bremsanlage gestört. Unverzüglich die nächste Fachwerkstatt aufsuchen, um den Schaden beheben zu lassen. Auf dem Weg dorthin mit geringer Geschwindigkeit fahren, sich dabei auf viel längere Bremswege und einen erhöhten Pedaldruck einstellen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"parkbremse" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sicherheitsgurt" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Sicherheitsgurt" Info:@"Nicht angelegter Sicherheitsgurt des Fahrers bzw. Beifahrers." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"elektromechanische_lenkung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Elektromechanische Lenkung" Info:@"Elektromechanische Lenkung ausgefallen. Lenkung umgehend von einem Fachwerkstatt prüfen lassen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"generator" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Generator" Info:@"Generator gestört. Fachwerkstatt aufsuchen. Elektrische Anlage prüfen lassen. Nicht erforderliche elektrische Verbraucher ausschalten. Fahrzeugbatterie wird während der nächsten Fahrt nicht vom Generator geladen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroeldruck" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motoröldruck" Info:@"Der Motoröldruck ist zu gering. Motor abstellen, Motorölstand prüfen. Blinkt die Warnleuchte, obwohl der Motorölstand in Ordnung ist, nicht weiterfahren. Fachmännische Hilfe in Anspruch nehmen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroelstand" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorölstand" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kuehlsystem" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Kühlsystem" Info:@"Das Motorkühlsystem ist gestört. Motor abstellen, Motor abkühlen lassen bis Zeiger wieder im Normalbereich ist. Motorkühlmittelstand prüfen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lenkungsverriegelung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Lenkungsverriegelung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zuendschloss" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Zündschloss" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geschwindigkeitswarnanlage_1" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Geschwindigkeitswarnanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geschwindigkeitswarnanlage_2" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Geschwindigkeitswarnanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_adativ_curise_control_2" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Adaptive Cruise Control" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"esc" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Elektronische Stabilisierungskontrolle" Info:@"Blinkt: ESC regelt. Leuchtet: Zündung aus- und einschalten. Gegebenenfalls eine kurze Wegstrecke fahren. Falls das Symbol danach trotzdem noch leuchtet, bitte Fachwerkstatt aufsuchen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abs" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Anti-Blockier-System (ABS)" Info:@"Das ABS ist gestört oder ausgefallen. Fachwerkstatt aufsuchen. Das Fahrzeug kann ohne ABS gebremst werden." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sicherheitssysteme" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Sicherheitssysteme" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bremsbelag" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Bremsbelag" Info:@"Bremsbeläge verschlissen. Sofort eine Fachwerkstatt aufsuchen. Alle Bremsbeläge prüfen und ggf. ersetzen lassen." AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"elektromechanische_parkbremse" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Parkbremse" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"reifendruck" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Reifendruck" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motorsteuerung_benzin" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorsteuerung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abgass_kontrollsystem" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Abgaskontrollsystem" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dieselpartikelfilter" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Partikelfilter" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"drehzahlbegrenzung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Drehzahlbegrenzung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroelstand_gelb" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorölstand" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motoroelsensor" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motorölsensor" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"motortemperatur" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Motortemperatur" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"baterieladung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Batterieladung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tanksystem" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Tanksystem" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"waschwasserstand" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Waschwasserstand" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"komfortschlussel" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Komfortschlüssel" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"baterie_funkschluessel" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Batterie im Funktionsschlüssel" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"lampenausfallkontrolle" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Lampenausfallkontrolle" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nebelscheinwerfer" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Nebelscheinwerfer" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"nebelschlussleuchte" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Nebelschlussleuchte" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dynamische_leuchtweitenregulierung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Dynamische Leuchtweitenregulierung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"adaptive_light" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Adaptive Light" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"licht-_regensensor" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Licht-/ Regensensor" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_active_lane_assist" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Audi Active Lane Assist" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"daempferregelung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Dämpferregelung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sportdiferenzial" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Sportdifferntial" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"scheibenwischer" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Scheibenwischer" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"elektromechanische_lenkung_dynamiklenkung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Dynamiklenkung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"getriebe" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Getriebe" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blinkeanlag" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Blinkanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"anhaenger_blinkeanlag" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Anhängerblinkanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geschwindigkeitsregelanlage" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Geschwindigkeitsregelanlage" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_adaptive_cruise_control" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Adaptive Cruise Control" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"anfahrtsassistent" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Anfahrtsassistent" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"audi_active_lane_assist_gruen" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Active Lane Assist" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"start_stop_system" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Start-Stop-System" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"start_stop_system_weiß" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Start-Stop-System" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pausenempfehlung" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Pausenempfehlung" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    image = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fernlicht" ofType:@"png"]];
    warningLight = [[WarningLight alloc] initWithName:@"Fernlicht" Info:@"" AndImage:image];
    [warningLights addObject:warningLight];
    
    self.warningLights = warningLights;
}

@end
