//
//  ServiceGuideStockService.h
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GuideService.h"
#import "Guide.h"
#import "Step.h"

@interface SearchableGuideService : NSObject <GuideService>
- (void) initGuideDictionary;
@property (nonatomic) NSArray* allGuides;
@property (nonatomic) NSArray* reducedGuides;
@end
