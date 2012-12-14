//
//  ManualGuideStockService.m
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ManualGuideStockService.h"

@implementation ManualGuideStockService
// Property guides stammt aus Protocol und muss deshalb synthetisiert werden!
@synthesize guides = _guides;


- (void) reduceGuidesWithSearchText: (NSString*) searchText
{

}

-(ManualGuideStockService*) initWithCar:(Car *) car
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

@end
