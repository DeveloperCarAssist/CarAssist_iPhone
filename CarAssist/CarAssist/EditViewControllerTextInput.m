//
//  EditViewControllerTextInput.m
//  CarAssist
//
//  Created by Erik Witt on 19.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewControllerTextInput.h"

@interface EditViewControllerTextInput ()<UIAlertViewDelegate>

@end

@implementation EditViewControllerTextInput

- (EditViewController*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentation: (NSArray*) valueRepresentation AndSelectedValueIndex: (int) selectedValueIndex
{
    self = [super initWithDelegate:delegate Values:values ValueRepresentation:valueRepresentation AndSelectedValueIndex:selectedValueIndex];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) display
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertView textFieldAtIndex:0];
    
    [alertView show];
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString* text = [alertView textFieldAtIndex:0].text;
        self.values = [NSArray arrayWithObject:text];
        self.valueRepresentations = [NSArray arrayWithObject:text];
        self.selectedValueIndex = 0;
        [self saveSetting];
    }
    
    [self.delegate viewWillAppear:YES];
    
}
@end
