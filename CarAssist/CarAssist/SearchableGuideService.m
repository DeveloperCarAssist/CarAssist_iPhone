//
//  ServiceGuideStockService.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SearchableGuideService.h"
#import "NSString+CarAssistString.h"
#import "Guide.h"
#import "Step.h"

@implementation SearchableGuideService
// Property guides stammt aus Protocol und muss deshalb synthetisiert werden!
@synthesize guides = _guides;

//
//  Service leer initialisieren
//
- (SearchableGuideService*) init
{
    self = [super init];
    
    if (self)
    {
        NSMutableArray* allGuides = [NSMutableArray array];
        self.allGuides = allGuides;
        self.reducedGuides = allGuides;
        
        [self initGuideDictionary];
    }
    
    return self;
}

-(SearchableGuideService*) initWithCar:(Car *) car
{
    self = [super init];
    return self;
}


/**
 * Initialisiert das Dictionary mit den Anleitungen.
 *
 */
- (void) initGuideDictionary
{
    self.guides = [NSMutableDictionary dictionary];
    NSMutableSet* serviceCategories = [NSMutableArray array];
    
    // Alle keys holen (Kategorien)
    for (Guide* guide in self.reducedGuides) {
        [serviceCategories addObject: guide.categoryName];
    }
    
    // Keys (Kategorien) mappen auf leere Liste.
    for (NSString* categoryName in serviceCategories) {
        NSMutableArray* guidesOfCategory = [NSMutableArray array];
        [self.guides setObject:guidesOfCategory forKey:categoryName];
    }
    
    // Liste der Kategorien mit entsprechenden Anleitungen füllen.
    for (Guide* guide in self.reducedGuides) {
        NSMutableArray* guidesOfCategory = [self.guides objectForKey:guide.categoryName];
        [guidesOfCategory addObject:guide];
    }
}


- (void) reduceReducedGuidesWithSearchText: (NSString*) searchText
{
    NSMutableArray* guides = [NSMutableArray array];
    
    if (![searchText isEqualToString:@""])
    {
        for (Guide* guide in self.reducedGuides) {
            if ([guide.name containsSubstring:searchText] || [guide.categoryName containsSubstring:searchText]) {
                [guides addObject:guide];
            }
        }
        
        self.reducedGuides = guides;
    }
}



/**
 * Aktualisiert das Dictionary, so dass nur Anleitungen enthalten sind, in denen der searchText enthalten ist. Mit Leerzeichen getrennte Worte werden als 2 verschiedene Suchbegriffe aufgefasst.
 *
 */
- (void) reduceGuidesWithSearchText: (NSString*) searchText
{
    NSArray* searchItems = [searchText componentsSeparatedByString:@" "];
    
    self.reducedGuides = self.allGuides;
    
    for (NSString* searchItem in searchItems) {
        [self reduceReducedGuidesWithSearchText: searchItem];
    }
    
    [self initGuideDictionary];
}






@end
