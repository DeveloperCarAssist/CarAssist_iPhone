//
//  CarFavoritViewController.m
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarFavoritViewController.h"
#import "CarListSelectorViewController.h"

@interface CarFavoritViewController () <CarListSelectorDelegate>
@property (strong) Profil *profil;
@end

@implementation CarFavoritViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithProfil: (Profil*) profil
{
    self = [super init];
    if (self) {
        self.profil = profil;
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action: @selector(addCarButtonClicked)];
    [self.navigationItem setRightBarButtonItem: addButton];
    [self.navigationItem setTitle: @"Profil"];
}

-(void)addCarButtonClicked
{
    UIActionSheet* sheet = [[UIActionSheet alloc]initWithTitle:@"Auto Hinzufügen" delegate: self cancelButtonTitle: @"Abbruch" destructiveButtonTitle: nil otherButtonTitles: @"Aus Liste wählen", @"Fahrgestellnummer eingeben", @"Fahrgestellnummer Scannen", nil ];
    
    [sheet showFromToolbar: self.navigationController.toolbar];

    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.profil.carList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
  
    Car *car = [self.profil.carList objectAtIndex: indexPath.row];
    cell.textLabel.text= car.modell;
    if (car == self.profil.car)
    {
        //[cell.imageView setImage: asdasd]; Image für Ausgewähltes Auto
    }
    else
    {
     //       [cell.imageView setImage:breakdownServiceCategoryImage]; Image für nicht ausgewählte Autos
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    Car *car = [self.profil.carList objectAtIndex: indexPath.row];
    self.profil.car= car;
    CarProfilViewController *carprofilcontroller = [[CarProfilViewController alloc] initWithCar: self.profil.car];
     [self.navigationController pushViewController:carprofilcontroller animated:YES];
    
}
#pragma mark - Table view delegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        CarListSelectorViewController* controller = [[CarListSelectorViewController alloc] initWithDelegate:self];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    if(buttonIndex == 1)
    {
        //Hier Fahrgestellnummer eigeben View Controller Pushen
    }
    if(buttonIndex==2)
    {
        //Hier Fahrgestellnummer Scannen View Controller Pushen
    }
}

- (void) carHasBeenSelected:(Car *)selectedCar
{
    [self.profil.carList addObject:selectedCar];
    [self.carFavoriteTableView reloadData];
}

@end
