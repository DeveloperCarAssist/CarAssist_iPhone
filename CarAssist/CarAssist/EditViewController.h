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

@property (nonatomic, weak) UIViewController* delegate;

@property (nonatomic) NSObject* value;
@property (nonatomic) NSString* valueRepresentation;

- (EditViewController*) initWithDelegate: (UIViewController*) delegate;

- (void) display;
- (void) setSaveBlock: (void (^) (NSObject*, NSString*)) block;
- (void) saveSetting;

@end
