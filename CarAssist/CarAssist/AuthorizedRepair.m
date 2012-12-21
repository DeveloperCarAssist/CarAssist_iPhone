//
//  AuthorizedRepair.m
//  CarAssist
//
//  Created by 0holst on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepair.h"

@implementation AuthorizedRepair
-(AuthorizedRepair *)initWithName:(NSString *) name Category:(NSString *)category andLocation:(CLLocationCoordinate2D) location
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.categoryName = category;
        self.location = location;
    }
    return self;
}
@end
