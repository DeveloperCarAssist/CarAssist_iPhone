//
//  Profil.h
//  SplitViewTest
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Universität Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Profile : NSObject
@property (nonatomic) NSString *vorname, *nachname,*emailAdresse,*lieblingsKEKSEEE;
@property (nonatomic) NSMutableArray *carList;
@property (nonatomic) Car *car;

// gibt das singleton Profil zurück.
+ (Profile*) getProfile;

@end
