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

- (EditViewControllerPicker*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentation: (NSArray *) valueRepresentation SelectedValueIndex: (int) selectedValueIndex AndImage: (UIImage*) image
{
    self = [super initWithDelegate: delegate Values:values ValueRepresentation:valueRepresentation AndSelectedValueIndex:  selectedValueIndex];
    if (self) {
        if(image == nil) {
            self.imageView.backgroundColor = [UIColor clearColor];
        } else {
            self.image = image;
        }
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
    self.selectedValueIndex = row;
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
