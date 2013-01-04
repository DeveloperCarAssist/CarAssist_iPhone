//
//  AuthorizedRepairService.m
//  CarAssist
//
//  Created by Dennis on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairService.h"
#import "AuthorizedRepair.h"

@implementation AuthorizedRepairService
-(SearchableService*) initWithCar:(Car *) car
{
    self = [super initWithCar:car];
    if(self)
    {
        switch (car.unid)
        {
            case 1:
                [self initServiceWithExampleDataBmwZ4];
                [self initDictionary];
                break;
            case 2:
                [self initServiceWithExampleDataVWGolfIV];
                [self initDictionary];
                break;
            default:
                @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"no service data for selected car" userInfo:nil];
                break;
        }
    }
    return self;
}



- (void) initServiceWithExampleDataVWGolfIV
{
    NSMutableArray* allItems = [NSMutableArray array];
    
    AuthorizedRepair *garage = [[AuthorizedRepair alloc] initWithName:@"VW Hauptniederlassung" Category:@"Hamburg" andLocation: CLLocationCoordinate2DMake(53.6001f, 9.9718f)];
    [allItems addObject:garage];
    
    garage = [[AuthorizedRepair alloc] initWithName:@"VW Filiale Bergedorf" Category:@"Hamburg" andLocation:
              CLLocationCoordinate2DMake(53.49120f, 10.2018f)];
    
    [allItems addObject:garage];
    self.allItems = allItems;
    self.reducedItems = allItems;
}

- (void) initServiceWithExampleDataBmwZ4
{
    NSMutableArray* allItems = [NSMutableArray array];
    
    AuthorizedRepair *garage = [[AuthorizedRepair alloc] initWithName:@"Hauptniederlassung" Category:@"Hamburg" andLocation:
                        CLLocationCoordinate2DMake(53.60009f, 9.97196f)];
    garage.street = @"Offakamp 10-20";
    garage.postalcode = @"22529";
    garage.city = @"Hamburg";
    garage.phone = @"040 / 55301-10";
    
    [allItems addObject:garage];

    garage = [[AuthorizedRepair alloc] initWithName:@"Niederlassung Wansdsbek" Category:@"Hamburg" andLocation:
                                CLLocationCoordinate2DMake(53.58695f, 10.09423f)];
    garage.street = @"Friedrich-Ebert-Damm 120";
    garage.postalcode = @"22047";
    garage.city = @"Hamburg";
    garage.phone = @"040 / 55301-30";
    
    [allItems addObject:garage];
    
    self.allItems = allItems;
    self.reducedItems = allItems;
}

@end
