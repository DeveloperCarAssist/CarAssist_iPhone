//
//  ServiceGuideStockService.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SearchableService.h"
#import "NSString+CarAssistString.h"
#import "Guide.h"


@implementation SearchableService
// Property guides stammt aus Protocol und muss deshalb synthetisiert werden!
@synthesize items = _guides;

//
//  Service leer initialisieren
//
- (SearchableService*) init
{
    self = [super init];
    
    if (self)
    {
        NSMutableArray* allGuides = [NSMutableArray array];
        self.allItems = allGuides;
        self.reducedItems = allGuides;
        
        [self initDictionary];
    }
    
    return self;
}

-(SearchableService*) initWithCar:(Car *) car
{
    self = [super init];
    return self;
}


/**
 * Initialisiert das Dictionary mit den Anleitungen.
 *
 */
- (void) initDictionary
{
    self.items = [NSMutableDictionary dictionary];
    NSMutableSet* serviceCategories = [NSMutableArray array];
    
    // Alle keys holen (Kategorien)
    for (Guide* guide in self.reducedItems) {
        [serviceCategories addObject: guide.categoryName];
    }
    
    // Keys (Kategorien) mappen auf leere Liste.
    for (NSString* categoryName in serviceCategories) {
        NSMutableArray* guidesOfCategory = [NSMutableArray array];
        [self.items setObject:guidesOfCategory forKey:categoryName];
    }
    
    // Liste der Kategorien mit entsprechenden Anleitungen füllen.
    for (Guide* guide in self.reducedItems) {
        NSMutableArray* guidesOfCategory = [self.items objectForKey:guide.categoryName];
        [guidesOfCategory addObject:guide];
    }
}


- (void) reduceReducedGuidesWithSearchText: (NSString*) searchText
{
    NSMutableArray* guides = [NSMutableArray array];
    
    if (![searchText isEqualToString:@""])
    {
        for (Guide* guide in self.reducedItems) {
            if ([guide.name containsSubstring:searchText] || [guide.categoryName containsSubstring:searchText]) {
                [guides addObject:guide];
            }
        }
        
        self.reducedItems = guides;
    }
}



/**
 * Aktualisiert das Dictionary, so dass nur Anleitungen enthalten sind, in denen der searchText enthalten ist. Mit Leerzeichen getrennte Worte werden als 2 verschiedene Suchbegriffe aufgefasst.
 *
 */
- (void) reduceGuidesWithSearchText: (NSString*) searchText
{
    NSArray* searchItems = [searchText componentsSeparatedByString:@" "];
    
    self.reducedItems = self.allItems;
    
    for (NSString* searchItem in searchItems) {
        [self reduceReducedGuidesWithSearchText: searchItem];
    }
    
    [self initDictionary];
}






@end
