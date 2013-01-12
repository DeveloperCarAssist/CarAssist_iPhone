//
//  EditViewControllerPicker.m
//  CarAssist
//
//  Created by Erik Witt on 16.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewControllerPicker.h"
#import "Utils.h"

@interface EditViewControllerPicker () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation EditViewControllerPicker

- (EditViewControllerPicker*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentations: (NSArray *) valueRepresentations AndImage: (UIImage*) image
{
    self = [super initWithDelegate: delegate];
    if (self)
    {
        self.values = values;
        self.valueRepresentations = valueRepresentations;
        self.image = image;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_profil_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    [self.imageView setImage:self.image];
    
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action: @selector(saveButtonPressed)];
    [self.navigationItem setRightBarButtonItem: addButton];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.valueRepresentations.count;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.valueRepresentations objectAtIndex: row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.value = [self.values objectAtIndex:row];
}

- (void) saveButtonPressed
{
    [self saveSetting];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) display
{
    [self.delegate.navigationController pushViewController:self animated:YES];
}

@end
