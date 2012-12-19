//
//  EditViewController.h
//  CarAssist
//
//  Created by Erik Witt on 15.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface EditViewController : UIViewController

@property (nonatomic) int selectedValueIndex;
@property (nonatomic) NSArray* values;
@property (nonatomic) NSArray* valueRepresentations;

- (EditViewController*) initWithValues: (NSArray*) values ValueRepresentation: (NSArray*) valueRepresentation AndSelectedValueIndex: (int) selectedValueIndex;
- (void) setSaveBlock: (void (^) (NSObject*, NSString*)) block;
- (void) saveSetting;

@end
