//
//  SettingCell.h
//  CarAssist
//
//  Created by Erik Witt on 15.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "EditViewController.h"

@interface SettingCell : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* valueRepresentation;
@property (nonatomic) NSObject* value;

@property (nonatomic) BOOL isEditable;
@property (nonatomic) UITableViewCellSelectionStyle cellSelectionStyle;
@property (nonatomic) NSString* cellIdentifier;
@property (nonatomic) EditViewController* editViewController;

- (SettingCell*) initWithTitle: (NSString*) title Value: (NSObject*) value AndValueRepresentation: (NSString*) valueRepresentation;

- (SettingCell*) initEditableWithTitle: (NSString*) title Value: (NSObject*) value ValueRepresentation: (NSString*) valueRepresentation AndEditViewController: (EditViewController*) editViewController;

@end
