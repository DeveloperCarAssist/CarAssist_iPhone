//
//  CarFavoritViewController.m
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarFavoritViewController.h"
#import "CarListSelectorViewController.h"
#import "CarDataViewController.h"

@interface CarFavoritViewController () <CarListSelectorDelegate>
@property (strong) Profile *profil;
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

-(id) initWithProfil: (Profile*) profil
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

// Ausgelöst vom Favoriten-Button...
-(void)changeDefaultCar:(id)sender event:(id)event
{
    // die dem Button zugeordnete Zelle und den Indexpath abfragen, dann
    // den Standardwagen setzen
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.carFavoriteTableView];
    NSIndexPath *indexPath = [self.carFavoriteTableView indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil)
    {
        Car *car = [self.profil.carList objectAtIndex: indexPath.row];
        self.profil.car = car;
        [self.carFavoriteTableView reloadData];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
  
    Car *car = [self.profil.carList objectAtIndex: indexPath.row];
    
    // "Favorit setzen" Buttons erzeugen
    CGFloat cellWidth = cell.frame.size.width;
    CGFloat cellHeight = cell.frame.size.height - 2.0f; // ein wenig kleiner damit die Rahmenlinien nicht überzeichnet werden
    UIImage* favoriteCar = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"favorit" ofType:@"png"]];
    UIImage* noFavoriteCar = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kein_favorit" ofType:@"png"]];
    UIButton *changeDefaultCarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeDefaultCarButton addTarget:self action:@selector(changeDefaultCar:event:) forControlEvents:UIControlEventTouchDown];
    changeDefaultCarButton.frame = CGRectMake(10.0f, 1.0f, cellHeight,cellHeight);

    // Zelle beschriften. cell.textLabel kann hier nicht verwendet werden, weil
    // der Button den Text überlappen würde. Deshalb erzeugen wir unser eigenes Label
    // und bestimmen die Anzeigeposition selbst.
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellHeight + 20.0f,1.0f,cellWidth - cellHeight - 10.0f, cellHeight)];
    textLabel.text =  [NSString stringWithFormat:@" %@ - %@ ",car.model, car.owner ];
    
    if (car == self.profil.car)
    {
        [changeDefaultCarButton setImage:favoriteCar forState:UIControlStateNormal];
        textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    }
    else
    {
        [changeDefaultCarButton setImage:noFavoriteCar forState:UIControlStateNormal];
        textLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    [cell addSubview:changeDefaultCarButton];
    [cell addSubview:textLabel];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    Car *car = [self.profil.carList objectAtIndex: indexPath.row];
    self.profil.car= car;
   // CarProfilViewController *carprofilcontroller = [[CarProfilViewController alloc] initWithCar: self.profil.car];
    CarDataViewController *carprofilcontroller = [[CarDataViewController alloc] initWithCar: self.profil.car];
     [self.navigationController pushViewController:carprofilcontroller animated:YES];
    
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.profil.carList removeObjectAtIndex:indexPath.row];
        [self.carFavoriteTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
