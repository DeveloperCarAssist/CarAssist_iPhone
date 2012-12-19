//
//  EditViewControllerTextInput.h
//  CarAssist
//
//  Created by Erik Witt on 19.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewControllerTextInput : EditViewController

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* message;

- (EditViewController*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentation: (NSArray*) valueRepresentation AndSelectedValueIndex: (int) selectedValueIndex;

@end
