//
//  CarDataViewController.m
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarDataViewController.h"
#import "CarEquipmentPackage.h"
#import "Utils.h"
#import "SettingCell.h"
#import "EditViewControllerPicker.h"
#import "SettingsValueService.h"
#import "EditViewControllerTextInput.h"

@interface CarDataViewController ()
@property Car* car;
@end

@implementation CarDataViewController

-(CarDataViewController*)initWithCar: (Car*)car
{
    self = [super init];
    if (self) {
        self.car = car;
        self.settingsValueService = [[SettingsValueService alloc] init];
        self.title = @"Autoprofil";
        self.settingsList = [NSMutableDictionary dictionary];
        self.sectionList = [NSMutableArray array];
        [self initCarDataSettings];
        [self initEquipmentPackageSettings];
        [self initServiceProviderSettings];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_profil_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableview reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* sectionName = [self.sectionList objectAtIndex:section];
    NSArray* settingsListForSection = [self.settingsList objectForKey:sectionName];
    return settingsListForSection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* sectionName = [self.sectionList objectAtIndex:indexPath.section];
    NSArray* settingsListForSection = [self.settingsList objectForKey:sectionName];
    SettingCell* settingCell = [settingsListForSection objectAtIndex:indexPath.row];
    
    NSString* cellIdentifier = settingCell.cellIdentifier;
    
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = settingCell.title;
    cell.detailTextLabel.text = settingCell.valueRepresentation;
    cell.selectionStyle = settingCell.cellSelectionStyle;
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* sectionName = [self.sectionList objectAtIndex:indexPath.section];
    NSArray* settingsListForSection = [self.settingsList objectForKey:sectionName];
    SettingCell* settingCell = [settingsListForSection objectAtIndex:indexPath.row];
    if (settingCell.isEditable) {
        [settingCell.editViewController display];
    }
}



-(NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    return [self.sectionList objectAtIndex:section];
}

- (void) initCarDataSettings
{
     NSMutableArray* carData = [NSMutableArray array];
    
    SettingCell* manufacturerCell = [[SettingCell alloc] initWithTitle:@"Hersteller" Value:self.car.manufacturer AndValueRepresentation:self.car.manufacturer];
    
    SettingCell* modelCell = [[SettingCell alloc] initWithTitle:@"Modell" Value:self.car.model AndValueRepresentation:self.car.model];
    
    EditViewControllerTextInput* editViewController = [[EditViewControllerTextInput alloc] initWithDelegate:self Values:[NSArray array] ValueRepresentation:[NSArray array] AndSelectedValueIndex:0];
    editViewController.title = @"Bezeichnung";
    editViewController.message = @"Bitte geben eine Bezeichnug ein";
    
    SettingCell* descriptionSetting = [[SettingCell alloc] initEditableWithTitle:@"Bezeichnung" Value:self.car.owner ValueRepresentation:self.car.owner AndEditViewController:editViewController];
    
    [descriptionSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.owner = (NSString*) value;
        descriptionSetting.value = value;
        descriptionSetting.valueRepresentation = self.car.owner;
    }];
    
    [carData addObject:manufacturerCell];
    [carData addObject:modelCell];
    [carData addObject:descriptionSetting];
    [self.settingsList setObject:carData forKey:@"Fahrzeug Daten"];
    [self.sectionList addObject:@"Fahrzeug Daten"];
}

- (void) initEquipmentPackageSettings
{
    NSMutableArray* equipment = [NSMutableArray array];
    
        
    SettingCell* navigationDeviceSetting = [self generatePickerCellWithTitle: @"Navigationsgerät" Value: self.car.equipmentPackage.navigationDevice   AndValueRepresenation: self.car.equipmentPackage.navigationDevice];
    
    [navigationDeviceSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage.navigationDevice = (NSString*) value;
        navigationDeviceSetting.value = value;
        navigationDeviceSetting.valueRepresentation = self.car.equipmentPackage.navigationDevice;
    }];
    
    SettingCell* radioSetting = [self generatePickerCellWithTitle: @"Radio" Value: self.car.equipmentPackage.radio   AndValueRepresenation: self.car.equipmentPackage.radio];
    
    [radioSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage.radio = (NSString*) value;
        radioSetting.value = value;
        radioSetting.valueRepresentation = self.car.equipmentPackage.radio;
    }];
    
    SettingCell* steeringWheelSetting = [self generatePickerCellWithTitle: @"Lenkrad" Value: self.car.equipmentPackage.steeringWheel   AndValueRepresenation: self.car.equipmentPackage.steeringWheel];
    
    [steeringWheelSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage.steeringWheel = (NSString*) value;
        steeringWheelSetting.value = value;
        steeringWheelSetting.valueRepresentation = self.car.equipmentPackage.steeringWheel;
    }];
    
    SettingCell* seatsSetting = [self generatePickerCellWithTitle: @"Sitze" Value: self.car.equipmentPackage.seats   AndValueRepresenation: self.car.equipmentPackage.seats];
    
    [seatsSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage.seats = (NSString*) value;
        seatsSetting.value = value;
        seatsSetting.valueRepresentation = self.car.equipmentPackage.seats;
    }];
    
    SettingCell* wheelDeviceSetting = [self generatePickerCellWithTitle: @"Lenkrad" Value: self.car.equipmentPackage.steeringWheel   AndValueRepresenation: self.car.equipmentPackage.steeringWheel];
    
    [wheelDeviceSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage.steeringWheel = (NSString*) value;
        wheelDeviceSetting.value = value;
        wheelDeviceSetting.valueRepresentation = self.car.equipmentPackage.steeringWheel;
    }];
    
    SettingCell* equipmentPackageSetting = [self generatePickerCellWithTitle: @"Ausstattungspaket" Value: self.car.equipmentPackage  AndValueRepresenation: self.car.equipmentPackage.packageName];
    
    [equipmentPackageSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage = (CarEquipmentPackage*) value;
        equipmentPackageSetting.value = value;
        equipmentPackageSetting.valueRepresentation = self.car.equipmentPackage.packageName;
        
        navigationDeviceSetting.value = self.car.equipmentPackage.navigationDevice;
        navigationDeviceSetting.valueRepresentation = self.car.equipmentPackage.navigationDevice;
        
        radioSetting.value = self.car.equipmentPackage.radio;
        radioSetting.valueRepresentation = self.car.equipmentPackage.radio;
        
        steeringWheelSetting.value = self.car.equipmentPackage.steeringWheel;
        steeringWheelSetting.valueRepresentation = self.car.equipmentPackage.steeringWheel;
        
        seatsSetting.value = self.car.equipmentPackage.seats;
        seatsSetting.valueRepresentation = self.car.equipmentPackage.seats;
    }];
    

    [equipment addObject:equipmentPackageSetting];
    [equipment addObject:navigationDeviceSetting];
    [equipment addObject:radioSetting];
    [equipment addObject:steeringWheelSetting];
    [equipment addObject:seatsSetting];
    [self.settingsList setObject:equipment forKey:@"Ausstattung"];
    [self.sectionList addObject:@"Ausstattung"];
}

- (void) initServiceProviderSettings
{
    NSMutableArray* provider = [NSMutableArray array];
    
    SettingCell* insuranceSetting = [self generatePickerCellWithTitle: @"Versicherung" Value: self.car.insurance  AndValueRepresenation: self.car.insurance];
    
    [insuranceSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.insurance = (NSString*) value;
        insuranceSetting.value = value;
        insuranceSetting.valueRepresentation = self.car.insurance;
    }];
    
    SettingCell* garageSetting = [self generatePickerCellWithTitle: @"Werkstatt" Value: self.car.garage  AndValueRepresenation: self.car.garage];
    
    [garageSetting.editViewController setSaveBlock:^(NSObject* value, NSString* valueRepresentation) {
        self.car.garage = (NSString*) value;
        garageSetting.value = value;
        garageSetting.valueRepresentation = self.car.garage;
    }];
    
    [provider addObject:insuranceSetting];
    [provider addObject:garageSetting];
    [self.settingsList setObject:provider forKey:@"Dienstleister"];
    [self.sectionList addObject:@"Dienstleister"];
}

- (SettingCell*) generatePickerCellWithTitle: (NSString*) title Value: (NSObject*) value AndValueRepresenation: (NSString*) valueRepresentation
{
    NSArray* values = [self.settingsValueService.settingValues objectForKey:title];
    NSArray* valuesRepresentations = [self.settingsValueService.settingValuesRepresentations objectForKey:title];
    
    EditViewController* pickerController = [[EditViewControllerPicker alloc] initWithDelegate: self Values:values ValueRepresentation:valuesRepresentations SelectedValueIndex:0 AndImage:nil];
    SettingCell* result = [[SettingCell alloc] initEditableWithTitle:title Value:value ValueRepresentation:valueRepresentation AndEditViewController:pickerController];
    return result;
    
}


@end
