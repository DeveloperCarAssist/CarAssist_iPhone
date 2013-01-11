//
//  EditViewControllerPicker.h
//  CarAssist
//
//  Created by Erik Witt on 16.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewControllerPicker : EditViewController

@property (nonatomic) UIImage* image;
@property (nonatomic) NSArray* values;
@property (nonatomic) NSArray* valueRepresentations;

@property (nonatomic) IBOutlet UIImageView* imageView;

- (EditViewControllerPicker*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentations: (NSArray *) valueRepresentations AndImage: (UIImage*) image;

@end
