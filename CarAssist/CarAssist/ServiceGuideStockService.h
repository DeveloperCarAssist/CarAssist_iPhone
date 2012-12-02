//
//  ServiceGuideStockService.h
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceGuideStockService : NSObject

/**
 * Maped vom Kategorie-Namen auf die Liste von Anleitungen dieser Kategorie.
 */
@property (nonatomic) NSMutableDictionary* guides;

@end
