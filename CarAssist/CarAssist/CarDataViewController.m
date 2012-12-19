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
        [self initSettingsList];
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
    return [self.settingsList allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* sectionName = [[self.settingsList allKeys] objectAtIndex:section];
    NSArray* settingsListForSection = [self.settingsList objectForKey:sectionName];
    return settingsListForSection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* sectionName = [[self.settingsList allKeys] objectAtIndex:indexPath.section];
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
    NSString* sectionName = [[self.settingsList allKeys] objectAtIndex:indexPath.section];
    NSArray* settingsListForSection = [self.settingsList objectForKey:sectionName];
    SettingCell* settingCell = [settingsListForSection objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:settingCell.editViewController animated:YES];
}



-(NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    return [[self.settingsList allKeys] objectAtIndex:section];
}

- (void) initSettingsList
{
    self.settingsList = [NSMutableDictionary dictionary];
    
    NSMutableArray* serviceProvider = [NSMutableArray array];
    
    SettingCell* insuranceSetting = [[SettingCell alloc] initWithTitle:@"Versicherung" Value:self.car.insurance AndValueRepresentation:self.car.insurance];
    insuranceSetting.isEditable = YES;
    insuranceSetting.cellSelectionStyle = UITableViewCellSelectionStyleGray;
    insuranceSetting.cellIdentifier = @"Cell2";
    NSMutableArray* insuranceValues = [NSMutableArray array];
    [insuranceValues addObject:@"Alianz"];
    [insuranceValues addObject:@"Provinzial"];
    [insuranceValues addObject:@"Huk Coburg"];
    insuranceSetting.editViewController = [[EditViewControllerPicker alloc] initWithValues:insuranceValues ValueRepresentation:insuranceValues SelectedValueIndex:0 AndImage:nil];
    
    void (^insuranceSaveBlock)(NSObject*, NSString*) = ^(NSObject* value, NSString* valueRepresentation) {
        self.car.insurance = (NSString*) value;
        insuranceSetting.value = value;
        insuranceSetting.valueRepresentation = valueRepresentation;
    };
    
    [insuranceSetting.editViewController setSaveBlock:insuranceSaveBlock];
    
    [serviceProvider addObject:insuranceSetting];
    [self.settingsList setObject:serviceProvider forKey:@"Dienstleister"];
    
    
    
    
    NSMutableArray* equipment = [NSMutableArray array];
    
    SettingCell* equipmentPackageSetting = [[SettingCell alloc] initWithTitle:@"Ausstattungspaket" Value:self.car.equipmentPackage AndValueRepresentation:self.car.equipmentPackage.packageName];
    equipmentPackageSetting.isEditable = YES;
    equipmentPackageSetting.cellSelectionStyle = UITableViewCellSelectionStyleGray;
    equipmentPackageSetting.cellIdentifier = @"Cell2";
    NSArray* values = [self.settingsValueService.settingValues objectForKey:equipmentPackageSetting.title];
    NSArray* valuesRepresentations = [self.settingsValueService.settingValuesRepresentations objectForKey:equipmentPackageSetting.title];
    equipmentPackageSetting.editViewController = [[EditViewControllerPicker alloc] initWithValues:values ValueRepresentation:valuesRepresentations SelectedValueIndex:0 AndImage:nil];
    
    void (^equipmentSaveBlock)(NSObject*, NSString*) = ^(NSObject* value, NSString* valueRepresentation) {
        self.car.equipmentPackage = (CarEquipmentPackage*) value;
        equipmentPackageSetting.value = value;
        equipmentPackageSetting.valueRepresentation = self.car.equipmentPackage.packageName;
    };
    
    [equipmentPackageSetting.editViewController setSaveBlock:equipmentSaveBlock];
    
    [equipment addObject:equipmentPackageSetting];
    [self.settingsList setObject:serviceProvider forKey:@"Ausstattung"];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
