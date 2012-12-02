//
//  ServiceGuideStockService.m
//  CarAssist
//
//  Created by 0witt on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceGuideStockService.h"

@implementation ServiceGuideStockService

- (ServiceGuideStockService*) init
{
    self = [super init];
    
    if (self)
    {
        self.guides = [NSDictionary dictionary];
    }
    
    return self;
}

@end
