//
//  EditViewControllerPicker.m
//  CarAssist
//
//  Created by Erik Witt on 16.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewControllerPicker.h"

@interface EditViewControllerPicker () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation EditViewControllerPicker

- (EditViewControllerPicker*) initWithValues: (NSArray*) values ValueRepresentation: (NSArray *) valueRepresentation SelectedValueIndex: (int) selectedValueIndex AndImage: (UIImage*) image
{
    self = [super initWithValues:values ValueRepresentation:valueRepresentation AndSelectedValueIndex:  selectedValueIndex];
    if (self) {
        self.image = image;
    }
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    self.selectedValueIndex = row;
}

- (void) saveButtonPressed
{
    [self saveSetting];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
