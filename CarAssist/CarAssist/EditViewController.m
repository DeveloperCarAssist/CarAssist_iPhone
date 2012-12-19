//
//  EditViewController.m
//  CarAssist
//
//  Created by Erik Witt on 15.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewController.h"

typedef void (^SaveBlock) (NSObject*, NSString*);

@interface EditViewController ()
{
    SaveBlock saveBlock;
}

@end

@implementation EditViewController

- (EditViewController*) initWithValues: (NSArray*) values ValueRepresentation: (NSArray*) valueRepresentation AndSelectedValueIndex: (int) selectedValueIndex
{
    self = [super init];
    if (self) {
        self.values = values;
        self.valueRepresentations = valueRepresentation;
        self.selectedValueIndex = selectedValueIndex;
    }
    return self;
}

- (void) saveSetting
{
    NSObject* selectedValue = [self.values objectAtIndex:self.selectedValueIndex];
    NSString* selectedValueRepresentation = [self.valueRepresentations objectAtIndex:self.selectedValueIndex];
    saveBlock(selectedValue, selectedValueRepresentation);
}

- (void) setSaveBlock: (SaveBlock) block
{
    saveBlock = block;
}

@end
