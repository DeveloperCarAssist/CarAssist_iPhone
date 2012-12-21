//
//  SearchableServiceProtocol.h
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@protocol SearchableServiceProtocol <NSObject>
@required
/**
 * Mapped vom Kategorie-Namen auf die Liste von Items dieser Kategorie.
 */
@property (nonatomic) NSMutableDictionary* items;
- (void) reduceItemsWithSearchText: (NSString*) searchText;
-(id<SearchableServiceProtocol>) initWithCar:(Car *) car;
@end
