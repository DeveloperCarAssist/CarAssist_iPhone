//
//  AuthorizedRepairService.m
//  CarAssist
//
//  Created by Dennis on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairService.h"
#import "AuthorizedRepair.h"

@interface AuthorizedRepairService()
    @property (nonatomic) CLLocation *userLocation;
@end

@implementation AuthorizedRepairService
-(SearchableService*) initWithCar:(Car *) car
{
    self = [super initWithCar:car];
    
    if(self)
    {
        [self initServiceData:car];
        [self initDictionary];
    }
    
    return self;
}

-(SearchableService*) initWithCar:(Car *) car andUserLocation:(CLLocation *) loc
{
    self = [super initWithCar:car];

    if(self)
    {
        self.userLocation = loc;
        [self initServiceData:car];
        [self sortByLocation];
        [self initDictionary];
    }
    
    return self;
}

-(void) initServiceData:(Car *)car
{
    if(car)
    {
        // TODO: Abfrage nur noch vom Hersteller abhängig machen
        switch (car.manufacturerID)
        {
            case 1:
                [self initServiceWithExampleDataAudi];
                break;
            case 2:
                [self initServiceWithExampleDataBMW];
                break;
            case 3:
                [self initServiceWithExampleDataVW];
                break;
            default:
                @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"no service data for selected car" userInfo:nil];
                break;
        }
    }
}

- (void) initServiceWithExampleDataAudi
{
    NSMutableArray* allItems = [NSMutableArray array];
    
    AuthorizedRepair *garage = [[AuthorizedRepair alloc] initWithName:@"Audi Zentrum Hamburg" Category:@"Hamburg" andLocation:
                                CLLocationCoordinate2DMake(53.604010f, 9.961430f)];
    garage.street = @"Kollaustraße 41-63";
    garage.postalcode = @"22529";
    garage.city = @"Hamburg";
    garage.phone = @"040/548000";
    garage.hours = [NSArray arrayWithObjects:@"07:00 - 19:00 Uhr", @"07:00 - 19:00 Uhr", @"07:00 - 19:00 Uhr", @"07:00 - 19:00 Uhr", @"07:00 - 19:00 Uhr", @"09:00 - 16:00 Uhr", @"11:00 - 17:00 Uhr", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"Willy Tiedtke (GmbH & Co.) KG" Category:@"Hamburg" andLocation:
              CLLocationCoordinate2DMake(53.587453f, 10.092854f)];
    garage.street = @"Friedrich-Ebert-Damm 118";
    garage.postalcode = @"22047";
    garage.city = @"Hamburg";
    garage.phone = @"040/694060";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"09.00 - 14.00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"Auto Wichert GmbH" Category:@"Hamburg" andLocation:
              CLLocationCoordinate2DMake(53.548820f, 10.032542f)];
    garage.street = @"Wendenstraße 150-160";
    garage.postalcode = @"20537";
    garage.city = @"Hamburg";
    garage.phone = @"040/2515160";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"09:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"Autohaus Schwarzenbek GmbH" Category:@"Schleswig-Holstein" andLocation:
              CLLocationCoordinate2DMake(53.511909f, 10.489776f)];
    garage.street = @"Möllner Straße 85";
    garage.postalcode = @"21493";
    garage.city = @"Schwarzenbek";
    garage.phone = @"04151/89250";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"09:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"Wolperding Automobile GmbH & Co. KG" Category:@"Niedersachsen" andLocation:
              CLLocationCoordinate2DMake(53.356757f, 10.202848f)];
    garage.street = @"Schlossring 48";
    garage.postalcode = @"21423";
    garage.city = @"Winsen";
    garage.phone = @"04171/7970";
    garage.hours = [NSArray arrayWithObjects:@"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"08:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    NSEnumerator *e = [allItems objectEnumerator];
    id object;
    while (object = [e nextObject]) {
        ((AuthorizedRepair *)object).userLocation = self.userLocation;
    }
    
    self.allItems = allItems;
    self.reducedItems = allItems;
}

- (void) initServiceWithExampleDataBMW
{
    NSMutableArray* allItems = [NSMutableArray array];
    
    AuthorizedRepair *garage = [[AuthorizedRepair alloc] initWithName:@"BMW AG Niederlassung Hamburg" Category:@"Hamburg" andLocation:
                                CLLocationCoordinate2DMake(53.60009f, 9.97196f)];
    garage.street = @"Offakamp 10-20";
    garage.postalcode = @"22529";
    garage.city = @"Hamburg";
    garage.phone = @"040 / 55301-10";
    garage.hours = [NSArray arrayWithObjects:@"07.00 - 19.00 Uhr", @"07.00 - 19.00 Uhr", @"07.00 - 19.00 Uhr", @"07.00 - 19.00 Uhr", @"07.00 - 19.00 Uhr", @"09.00 - 14.00 Uhr", @"11.00 - 17.00 Uhr", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"BMW AG Niederlassung Hamburg Filiale Wandsbek" Category:@"Hamburg" andLocation:
                                CLLocationCoordinate2DMake(53.586950f, 10.094230f)];
    garage.street = @"Friedrich-Ebert-Damm 120";
    garage.postalcode = @"22047";
    garage.city = @"Hamburg";
    garage.phone = @"040/5530130";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"09:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"May & Olde GmbH" Category:@"Schleswig-Holstein" andLocation:
              CLLocationCoordinate2DMake(53.748649f, 9.687675f)];
    garage.street = @"Hamburger Straße 134";
    garage.postalcode = @"25337";
    garage.city = @"Elmshorn";
    garage.phone = @"04121/90770";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"08:00 - 18:00 Uhr", @"09:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"STADAC Automobilges. GmbH & Co." Category:@"Schleswig-Holstein" andLocation:
              CLLocationCoordinate2DMake(53.667137f, 9.976465f)];
    garage.street = @"Niendorfer Straße 151";
    garage.postalcode = @"22848";
    garage.city = @"Norderstedt";
    garage.phone = @"040/5488000";
    garage.hours = [NSArray arrayWithObjects:@"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"08:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"B & K GmbH & Co. KG" Category:@"Niedersachsen" andLocation:
              CLLocationCoordinate2DMake(53.352450f, 10.226810f)];
    garage.street = @"Lüneburger Straße 128-130";
    garage.postalcode = @"22848";
    garage.city = @"Winsen/Luhe";
    garage.phone = @"04171/78440";
    garage.hours = [NSArray arrayWithObjects:@"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"08:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    NSEnumerator *e = [allItems objectEnumerator];
    id object;
    while (object = [e nextObject]) {
        ((AuthorizedRepair *)object).userLocation = self.userLocation;
    }
    
    self.allItems = allItems;
    self.reducedItems = allItems;
}

- (void) initServiceWithExampleDataVW
{
    NSMutableArray* allItems = [NSMutableArray array];
    
    AuthorizedRepair *garage = [[AuthorizedRepair alloc] initWithName:@"Volkswagen Zentrum Hamburg Raffay GmbH & Co. KG" Category:@"Hamburg" andLocation: CLLocationCoordinate2DMake(53.5694437f, 9.9590983f)];
    
    garage.street = @"Fruchtallee 29";
    garage.postalcode = @"20259";
    garage.city = @"Hamburg";
    garage.phone = @"040/431720";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"09.00 - 14.00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"Volkswagen Automobile Hamburg GmbH" Category:@"Hamburg" andLocation:
              CLLocationCoordinate2DMake(53.58939f, 10.02297f)];

    garage.street = @"Wiesendamm 120";
    garage.postalcode = @"22303";
    garage.city = @"Hamburg";
    garage.phone = @"040/2707980";
    garage.hours = [NSArray arrayWithObjects:@"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"06:30 - 19:00 Uhr", @"08:00 - 13:00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];


    garage = [[AuthorizedRepair alloc] initWithName:@"Volkswagen Automobile Ahrensburg GmbH" Category:@"Schleswig-Holstein" andLocation:
              CLLocationCoordinate2DMake(53.58939f, 10.02297f)];
    
    garage.street = @"Hamburger Straße 40";
    garage.postalcode = @"22926";
    garage.city = @"Ahrensburg";
    garage.phone = @"04102/51540";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"09.00 - 14.00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"Autohaus Elmshorn GmbH & Co. KG" Category:@"Schleswig-Holstein" andLocation:
              CLLocationCoordinate2DMake(53.748506f, 9.697167f)];
    
    garage.street = @"Farmers Ring 2";
    garage.postalcode = @"25337";
    garage.city = @"Kölln-Reisiek";
    garage.phone = @"04121/571400";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"09.00 - 14.00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];

    garage = [[AuthorizedRepair alloc] initWithName:@"Köhnke Meckelfeld GmbH & Co. KG" Category:@"Niedersachsen" andLocation:
              CLLocationCoordinate2DMake(53.417480f, 10.019850f)];
    
    garage.street = @"Glüsinger Straße 50";
    garage.postalcode = @"21217";
    garage.city = @"Seevetal";
    garage.phone = @"040/7684083";
    garage.hours = [NSArray arrayWithObjects:@"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"08:00 - 18:30 Uhr", @"09.00 - 14.00 Uhr", @"Geschlossen", nil];
    
    [allItems addObject:garage];
    
    NSEnumerator *e = [allItems objectEnumerator];
    id object;
    while (object = [e nextObject]) {
        ((AuthorizedRepair *)object).userLocation = self.userLocation;
    }
    
    self.allItems = allItems;
    self.reducedItems = allItems;
}

- (void) sortByLocation
{
    for (AuthorizedRepair* repair in self.allItems) {
        repair.categoryName = @"Nach Entfernung";
    }

    NSArray* sortedArray = [self.allItems sortedArrayUsingSelector:@selector(compare:)];
    self.allItems = sortedArray;
    
    self.reducedItems = self.allItems;
}

@end
