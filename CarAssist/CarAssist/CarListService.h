//
// Diese Klasse kümmert sich darum alle verfügbaren Automodelle zur Verfügung zu Stellen
//
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarListService : NSObject
//Erstellt eine AutoListenService mit Beispieldaten
-(CarListService*) initWithExampleData;
//Gibt alle Hersteller zurück
-(NSArray*) giveAllProducer;
//gibt alle Modelle für einen Hersteller an
-(NSArray*) giveAllCarModels: (NSString*) fromProducer;

@property (nonatomic) NSMutableDictionary* cars;

@end