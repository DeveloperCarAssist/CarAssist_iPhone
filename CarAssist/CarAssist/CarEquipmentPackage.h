//
//  CarEquipmentPackage.h
//  CarAssist
//
//  Created by 0witt on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarEquipmentPackage : NSObject

@property (nonatomic) NSString* packageName;
@property (nonatomic) NSString *navigationDevice, *radio, *steeringWheel, *seats;

@end
