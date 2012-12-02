//
// Diese Klasse kümmert sich darum alle verfügbaren Automodelle zur Verfügung zu Stellen
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarListService.h"
#import "Car.h"
@interface CarListService()

@property NSMutableArray *producerlist;
@property NSMutableDictionary *modelList;

@end
@implementation CarListService

-(CarListService*) initWithExampleData
{
    self =  [super init];
    if(self) {
                Car *car = [[Car alloc ]initWithExampleData];
    self.producerlist= [[NSMutableArray alloc] initWithObjects: car.producer, nil];
        self.modelList= [[NSMutableDictionary alloc] initWithCapacity: self.producerlist.count];
        NSMutableArray *forBMW = [[NSMutableArray alloc] initWithObjects: car , nil];
        [self.modelList setObject: forBMW forKey: car.producer];
    }
    return self;
}

-(NSArray*) giveAllProducer
{
    return self.producerlist;
}

-(NSArray*) giveAllCarModels: (NSString*) fromProducer
{
    return [self.modelList objectForKey: fromProducer];
}
@end
