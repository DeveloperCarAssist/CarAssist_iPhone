//
//  SettingCell.m
//  CarAssist
//
//  Created by Erik Witt on 15.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

- (SettingCell*) initWithTitle: (NSString*) title Value: (NSObject*) value AndValueRepresentation: (NSString*) valueRepresentation
{
    self = [super init];
    if (self) {
        self.title = title;
        self.value = value;
        self.valueRepresentation = valueRepresentation;
    }
    return self;
}

@end
