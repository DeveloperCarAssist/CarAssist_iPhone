//
//  SearchableService.h
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchableServiceProtocol.h"

@interface SearchableService : NSObject <SearchableServiceProtocol>
- (void) initDictionary;
@property (nonatomic) NSArray* allItems;
@property (nonatomic) NSArray* reducedItems;
@end
