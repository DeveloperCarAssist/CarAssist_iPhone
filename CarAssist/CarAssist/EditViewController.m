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

- (EditViewController*) initWithDelegate: (UIViewController*) delegate;
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.value = nil;
        self.valueRepresentation = nil;
    }
    return self;
}

- (void) saveSetting
{
    saveBlock(self.value, self.valueRepresentation);
}

- (void) setSaveBlock: (SaveBlock) block
{
    saveBlock = block;
}

- (void) display
{
    [NSException raise:@"Abstract Class" format:@"This method must be overridden in subclass"];
}

@end
