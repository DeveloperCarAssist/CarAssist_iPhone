//
//  CarDataViewController.m
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarDataViewController.h"
#import "RadioPickerController.h"
#import "AccessoryService.h"

@interface CarDataViewController ()
@property Car* car;
@property AccessoryService* accessory;
@end

@implementation CarDataViewController

-(CarDataViewController*)initWithCar: (Car*)car
{
    self = [super init];
    if (self) {
        self.car=car;
        self.title= @"Autoprofil";
        self.accessory= [[AccessoryService alloc] initWithCar:car];
        self.carSettingsHelper = [[CarSettingsHelper alloc] initWithCar: car];
    }
    return self;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableview reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carSettingsHelper.settings.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* sectionArray = [self.carSettingsHelper.settings  objectAtIndex:section];
    return sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* sectionArray = [self.carSettingsHelper.settings objectAtIndex:indexPath.section];
    
    static NSString* CellIdentifier = @"Cell2";
    UITableViewCell* cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSString* setting = [sectionArray objectAtIndex:indexPath.row];
    cell.textLabel.text = setting;
    cell.detailTextLabel.text = [self.carSettingsHelper.settingsData objectForKey:setting];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            // Fahrzeug
            if (indexPath.row == 2) {
                // Bezeichnung
            }
            break;
        case 1:
            // Ausstattung
            switch (indexPath.row) {
                case 0:
                    // Ausstattungspaket
                    break;
                case 1:
                    // Navigationsgerät
                    break;
                case 2:
                    // Radio
                    break;
                case 3:
                    // Lenkrad
                    break;
                case 4:
                    // Sitze
                    break;
                case 5:
                    // Getriebe
                    break;
                    
                default:
                    break;
            }
            break;
        case 2:
            // Dienstleister
            switch (indexPath.row) {
                case 0:
                    // Versicherung
                    break;
                case 1:
                    // Werkstätten
                    break;
                    
                default:
                    break;
            }
            break;
        default:
            break;
    }
}



-(NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    return [self.carSettingsHelper.sections objectAtIndex:section];
}



@end
