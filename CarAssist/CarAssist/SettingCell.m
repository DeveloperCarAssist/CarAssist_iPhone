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
        self.isEditable = NO;
        self.cellSelectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (SettingCell*) initEditableWithTitle: (NSString*) title Value: (NSObject*) value ValueRepresentation: (NSString*) valueRepresentation AndEditViewController: (EditViewController*) editViewController
{
    self = [self initWithTitle:title Value:value AndValueRepresentation:valueRepresentation];
    if (self) {
        self.isEditable = YES;
        self.cellSelectionStyle = UITableViewCellSelectionStyleGray;
        self.cellIdentifier = @"Cell2";
        self.editViewController = editViewController;
        self.editViewController.value = self.value;
        self.editViewController.valueRepresentation = self.valueRepresentation;
    }
    return self;
}

@end
