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
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *items = [self.categoryService.items objectForKey:key];
    AuthorizedRepair *shop = [items objectAtIndex:indexPath.row];
    
    AuthorizedRepairDetailViewController *controller = [[AuthorizedRepairDetailViewController alloc] initWithAuthorizedRepair:shop];
    [self.navigationController pushViewController:controller animated:YES];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell;
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    [manager stopUpdatingLocation];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blueColor];
    self.isGPS = YES;
    // Service mit aktuellen Koordinaten initialisieren
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[AuthorizedRepairService alloc] initWithCar:car andUserLocation:[locations lastObject]];

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
