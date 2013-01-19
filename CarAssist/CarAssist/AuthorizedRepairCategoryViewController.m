//
//  AuthorizedRepairCategoryControllerViewController.m
//  CarAssist
//
//  Created by Dennis on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairCategoryViewController.h"
#import "Utils.h"
#import "Profile.h"
#import "AuthorizedRepairService.h"
#import "AuthorizedRepairDetailViewController.h"

@interface AuthorizedRepairCategoryViewController () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) BOOL isGPS;
@property (nonatomic) Profile* profile;

@end

@implementation AuthorizedRepairCategoryViewController

-(id) init
{
    self = [super initWithNibName:@"CategoryViewController" bundle:nil];
    if(self && self.locationManager == Nil)
    {
        CLLocationManager *manager = [[CLLocationManager alloc] init];
        
        manager.delegate = self;
        manager.distanceFilter = kCLDistanceFilterNone;
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        self.isGPS = NO;
        self.profile = [Profile getProfile];
        
        self.locationManager = manager;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Werkstätten";
    // Hintergrundgrafik einbinden
    self.categoryTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren

    self.categoryService = [[AuthorizedRepairService alloc] initWithCar:self.profile.car];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"GPS" style:UIBarButtonItemStyleBordered target:self action:@selector(gpsButtonTouched)];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.categoryTableView reloadData];
}

-(void) gpsButtonTouched
{
    if (self.isGPS) {
        self.categoryService = [[AuthorizedRepairService alloc] initWithCar:self.profile.car];
        [self.categoryTableView reloadData];
        self.navigationItem.rightBarButtonItem.tintColor = nil;
        self.isGPS = NO;
    }
    else {
        if(![CLLocationManager locationServicesEnabled])
        {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hinweis" message:@"Bitte aktivieren Sie den Ortungsdienst Telefoneinstellungen." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [message show];
        } else {
            [self.locationManager startUpdatingLocation];
        }
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger newSection;

    AuthorizedRepair *shop;
    if (![self.profile.car.garage.name isEqualToString:@"Keine Werkstatt"]) {
        if (indexPath.section == 0)
        {
            shop = self.profile.car.garage;
        }
        else
        {
            newSection = indexPath.section -1;
        }
    }
    else
    {
        newSection = indexPath.section;
    }
    
    if(!shop)
    {
        NSArray *keys = [self.categoryService.items allKeys];
        NSString *key = [keys objectAtIndex:newSection];
        NSArray *items = [self.categoryService.items objectForKey:key];
        shop = [items objectAtIndex:indexPath.row];
    }
    
    AuthorizedRepairDetailViewController *controller = [[AuthorizedRepairDetailViewController alloc] initWithAuthorizedRepair:shop];
    [self.navigationController pushViewController:controller animated:YES];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self.profile.car.garage.name isEqualToString:@"Keine Werkstatt"])
    {
        if (indexPath.section == 0)
        {
            //  Zelle für den Favoriten
            
            UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                              reuseIdentifier:@"standard"];
            cell.textLabel.text = self.profile.car.garage.name;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            [self decorateCell:cell withItem:self.profile.car.garage]; // Anzeige der Entfernung im Favoriten berechnen
            
            return cell;
        }
        else
        {
            NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1];
    
            UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:newIndexPath];
            return cell;
        }
    }
    else
    {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (![self.profile.car.garage.name isEqualToString:@"Keine Werkstatt"]) {
        return [super numberOfSectionsInTableView:tableView] + 1; 
    }
    else
    {
        return [super numberOfSectionsInTableView:tableView];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (![self.profile.car.garage.name isEqualToString:@"Keine Werkstatt"]) {
        if (section == 0)
        {
            return 1;
        }
        else
        {
            return [super tableView:tableView numberOfRowsInSection:section - 1];
        }
    }
    else
    {
        return [super tableView:tableView numberOfRowsInSection:section];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (![self.profile.car.garage.name isEqualToString:@"Keine Werkstatt"]) {
        if (section == 0) {
        
            UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
            //!todo hier noch schöneren Hintergrund einbauen
            sectionView.backgroundColor = [UIColor lightGrayColor];
            
            UILabel *label = [[UILabel alloc] initWithFrame:sectionView.frame];
            label.textColor = [UIColor blackColor];
            label.backgroundColor = [UIColor clearColor];
            label.text = @"Favorit";
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont boldSystemFontOfSize:18];
        
        
            [sectionView addSubview:label];
            return sectionView;
        
        }
        else
        {
            return [super tableView:tableView viewForHeaderInSection:section - 1];
        }
    }
    else
    {
        return [super tableView:tableView viewForHeaderInSection:section];
    }
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    [manager stopUpdatingLocation];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blueColor];
    self.isGPS = YES;
    
    CLLocation *loc = [locations lastObject];
    
    // Favorit mit Benutzerkoordinaten versehen
    self.profile.car.garage.userLocation = loc;
    // Service mit aktuellen Koordinaten initialisieren
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[AuthorizedRepairService alloc] initWithCar:car andUserLocation:loc];

    [self.categoryTableView reloadData];

}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error
{
    [manager stopUpdatingLocation];
    if(error.code == kCLErrorDenied)
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hinweis" message:@"Bitte erlauben Sie den Zugriff auf den Ortungsdienst in den Telefoneinstellungen." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }
}

-(void)decorateCell:(UITableViewCell *)cell withItem:(id<SearchableItem>)item
{
    AuthorizedRepair *shop = (AuthorizedRepair *) item;
    CLLocationDistance disancekm = [shop distance] / 1000.0;
    if(disancekm > 0 && self.isGPS)
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Entfernung: %.1lfkm", disancekm];
        cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    else
    {
        cell.detailTextLabel.text = @"";
    }
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[AuthorizedRepairService alloc] initWithCar:car];
}

@end
