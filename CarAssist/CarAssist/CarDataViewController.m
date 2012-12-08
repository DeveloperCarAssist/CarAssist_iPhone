//
//  CarDataViewController.m
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarDataViewController.h"

@interface CarDataViewController ()
@property Car* car;
@end

@implementation CarDataViewController

-(CarDataViewController*)initWithCar: (Car*)car
{
    self = [super init];
    if (self) {
        self.car=car;
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
        i=3;
    }
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    int row = indexPath.row;
    if(indexPath.section ==0)
    {
        
        if(row == 0)
        {
            cell.textLabel.text=@"Hersteller";
            cell.detailTextLabel.text=self.car.producer;
        }
        if(row == 1)
        {
            cell.textLabel.text=@"Modell";
            cell.detailTextLabel.text=self.car.modell;

        }
        
    }
    
    if(indexPath.section == 1)
    {
    
        if(row == 0)
        {
            cell.textLabel.text=@"Radio";
            cell.detailTextLabel.text=self.car.radio;
        }
        if(row == 1)
        {
            cell.textLabel.text=@"Navigation";
            cell.detailTextLabel.text=self.car.navigation;
        }
        if(row == 2)
        {
            cell.textLabel.text=@"seatHeater";
            cell.detailTextLabel.text=self.car.seatHeater;
        }
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

-(NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
    {
        return @"Daten";
    }
    if(section == 1)
    {
        return @"Ausstattung";
    }
    return nil;
}

@end
