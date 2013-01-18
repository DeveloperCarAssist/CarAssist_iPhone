//
//  SearchableService.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SearchableService.h"
#import "NSString+CarAssistString.h"
#import "SearchableItem.h"


@implementation SearchableService
// Property guides stammt aus Protocol und muss deshalb synthetisiert werden!
@synthesize items = _items;

//
//  Service leer initialisieren
//
- (SearchableService*) init
{
    self = [super init];
    
    if (self)
    {
        NSMutableArray* allItems = [NSMutableArray array];
        self.allItems = allItems;
        self.reducedItems = allItems;
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
    NSMutableSet* searchableCategories = [NSMutableArray array];
    
    // Alle keys holen (Kategorien)
    for (id<SearchableItem> item in self.reducedItems) {
        [searchableCategories addObject: item.categoryName];
    }
    
    // Keys (Kategorien) mappen auf leere Liste.
    for (NSString* categoryName in searchableCategories) {
        NSMutableArray* itemsOfCategory = [NSMutableArray array];
        [self.items setObject:itemsOfCategory forKey:categoryName];
    }
    
    // Liste der Kategorien mit entsprechenden Anleitungen füllen.
    for (id<SearchableItem>item in self.reducedItems) {
        NSMutableArray* guidesOfCategory = [self.items objectForKey:item.categoryName];
        [guidesOfCategory addObject:item];
    }
}


- (void) reduceReducedItemsWithSearchText: (NSString*) searchText
{
    NSMutableArray* items = [NSMutableArray array];
    
    if (![searchText isEqualToString:@""])
    {
        for (id<SearchableItem>item in self.reducedItems) {
            if ([item.name containsSubstring:searchText] || [item.categoryName containsSubstring:searchText]) {
                [items addObject:item];
            }
        }
        
        self.reducedItems = items;
    }
}



/**
 * Aktualisiert das Dictionary, so dass nur Items enthalten sind, in denen der searchText enthalten ist. Mit Leerzeichen getrennte Worte werden als 2 verschiedene Suchbegriffe aufgefasst.
 *
 */
- (void) reduceItemsWithSearchText: (NSString*) searchText
{
    NSArray* searchItems = [searchText componentsSeparatedByString:@" "];
    
    self.reducedItems = self.allItems;
    
    for (NSString* searchItem in searchItems) {
        [self reduceReducedItemsWithSearchText: searchItem];
    }
    
    [self initDictionary];
}






@end
