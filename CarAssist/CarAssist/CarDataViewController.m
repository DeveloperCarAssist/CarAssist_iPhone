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
@property AccessoryService *accessory;
@end

@implementation CarDataViewController

-(CarDataViewController*)initWithCar: (Car*)car
{
    self = [super init];
    if (self) {
        self.car=car;
        self.title= @"Autoprofil";
        self.accessory= [[AccessoryService alloc] initWithCar:car];
        
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int i = -1;
    if(section==0)
    {
        i=2;
    }
    if (section == 1) {
        i=4;
    }
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    int row = indexPath.row;
    if(indexPath.section ==0)
    {
        if(row <= 1)
        {
            static NSString *CellIdentifier = @"Cell1";
         cell= [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        }
        if(row == 0)
        {
            cell.textLabel.text=@"Hersteller";
            cell.detailTextLabel.text=self.car.manufacturer;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        if(row == 1)
        {
            cell.textLabel.text=@"Modell";
            cell.detailTextLabel.text=self.car.model;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

        }
        }

    }
    
    if(indexPath.section == 1)
    {
        static NSString *CellIdentifier = @"Cell2";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        if(row == 0)
        {
            cell.textLabel.text=@"Bezeichnung";
            cell.detailTextLabel.text=self.car.owner;
        }
        if(row == 1)
        {
            cell.textLabel.text=@"Navigation";
            cell.detailTextLabel.text=self.car.navigation;
        }
        if(row == 2)
        {
            cell.textLabel.text=@"Sitzheizung";
            cell.detailTextLabel.text=self.car.seatHeater;
        }
        if (row == 3) {
            cell.textLabel.text=@"Radio";
            cell.detailTextLabel.text=self.car.radio;
        }
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(indexPath.section == 1 && indexPath.row == 3)
   {
       RadioPickerController* radioController = [[RadioPickerController alloc] initWithCar: self.car andAccessoryService:self.accessory];
     //  radioController.view.frame = CGRectMake(0, 70, radioController.view.frame.size.width, radioController.view.frame.size.height);
       [self.navigationController pushViewController: radioController animated:YES];
       
       // Override point for customization after application launch
     //  [self.view makeKeyAndVisible];
   }
}

-(NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
    {
        return @"Fahrzeug";
    }
    if(section == 1)
    {
        return @"Ausstattung & Daten";
    }
    return nil;
}

@end
