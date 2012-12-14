//
//  RadioPickerController.m
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "RadioPickerController.h"
#import "AccessoryService.h"

@interface RadioPickerController ()
@property Car* car;
@property NSString *radio;
@property AccessoryService *accessoryService;
@end

@implementation RadioPickerController
-(RadioPickerController*) initWithCar: (Car*) car andAccessoryService:(AccessoryService*) accessoryService
{
    self = [super init];
    if (self) {
        self.car=car;
        self.title=@"Radio";
        self.accessoryService = accessoryService;
    }
    return self;
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
            [self.imageView setImage: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Autoradio" ofType:@"jpeg"]]];
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action: @selector(doneButtonPressed)];
    [self.navigationItem setRightBarButtonItem: addButton];
    self.radio = [self.accessoryService.radios objectAtIndex:0]; // Der 0te Eintrag der Accessory-Service Liste wird als Standard angenommen!
}

-(void)doneButtonPressed
{
     self.car.equipmentPackage.radio=self.radio;
     [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
   return [self.accessoryService.radios count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.accessoryService.radios objectAtIndex: row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.radio = [self.accessoryService.radios objectAtIndex: row];
    
}

@end
