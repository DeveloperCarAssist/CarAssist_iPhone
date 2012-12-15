//
//  GuideStockService.h
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@protocol GuideService <NSObject>
@required
/**
 * Maped vom Kategorie-Namen auf die Liste von Anleitungen dieser Kategorie.
 */
@property (nonatomic) NSMutableDictionary* guides;
- (void) reduceGuidesWithSearchText: (NSString*) searchText;
-(id<GuideService>) initWithCar:(Car *) car;
@end
