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

@property (nonatomic) Profile* profile;
@property (nonatomic) BOOL isGPS;

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

- (AuthorizedRepairCategoryViewController*) initWithGPS
{
    self = [self init];
    if (self) {
        [self gpsButtonTouched];
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
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guidesOfCategory = [self.categoryService.items objectForKey: key];
    AuthorizedRepair* garage = [guidesOfCategory objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = nil;
    
    if (![self.profile.car.garage.name isEqualToString:@"Keine Werkstatt"])
    {
        if (indexPath.section == 0)
        {
            //  Zelle für den Favoriten
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                              reuseIdentifier:@"standard"];
            cell.textLabel.text = self.profile.car.garage.name;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            [self decorateCell:cell withItem:self.profile.car.garage]; // Anzeige der Entfernung im Favoriten berechnen
            
        }
        else
        {
            NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 1];
    
             cell = [super tableView:tableView cellForRowAtIndexPath:newIndexPath];
        }
    }
    else
    {
        cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    // Anzeigen, ob Werkstatt offen hat.
    if ([self isOpen:garage.hours]) {
        [cell.imageView setImage:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"open" ofType:@"png"]]];
    }
    else
    {
        [cell.imageView setImage:[UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"closed" ofType:@"png"]]];
    }
    
    
    return cell;
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

            sectionView.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"section_stoerung"] scaledToSize: sectionView.frame.size]];
            
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

-(void)decorateSectionHeader:(UIView *)view withLabel:(UILabel *)label
{
    view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"section_stoerung"] scaledToSize: view.frame.size]];
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

- (BOOL) isOpen:(NSArray*) houres
{
    NSDate *now = [NSDate date];
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    [weekday setDateFormat: @"EEEE"];
    NSString* weekdayString = [weekday stringFromDate:now];
    
    if ([weekdayString isEqualToString:@"Monday"]) {
        return [self open:[houres objectAtIndex:0]];
    }
    if ([weekdayString isEqualToString:@"Tuesday"]) {
        return [self open:[houres objectAtIndex:1]];
    }
    if ([weekdayString isEqualToString:@"Wednesday"]) {
        return [self open:[houres objectAtIndex:2]];
    }
    if ([weekdayString isEqualToString:@"Thursday"]) {
        return [self open:[houres objectAtIndex:3]];
    }
    if ([weekdayString isEqualToString:@"Friday"]) {
        return [self open:[houres objectAtIndex:4]];
    }
    if ([weekdayString isEqualToString:@"Saturday"]) {
        return [self open:[houres objectAtIndex:5]];
    }
    if ([weekdayString isEqualToString:@"Sunday"]) {
        return [self open:[houres objectAtIndex:6]];
    }
    return NO;
}

- (BOOL) open:(NSString*) interval
{
    if ([interval isEqualToString:@"Geschlossen" ]) {
        return NO;
    }
    
    NSArray* houres = [interval componentsSeparatedByString:@" "];

    NSString* openingString = [houres objectAtIndex:0];
    NSArray* openingArray = [openingString componentsSeparatedByString:@":"];
    NSString* closingString = [houres objectAtIndex:2];
    NSArray* closingArray = [closingString componentsSeparatedByString:@":"];
    
    int openingHour = [[openingArray objectAtIndex:0] intValue];
    int openingMinute = [[openingArray objectAtIndex:1] intValue];
    
    int closingHour = [[closingArray objectAtIndex:0] intValue];
    int closingMinute = [[closingArray objectAtIndex:1] intValue];
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit|NSMinuteCalendarUnit) fromDate:now];

    int currentHour = components.hour;
    int currentMinute = components.minute;
    
    if (currentHour > openingHour &&  currentHour < closingHour) {
        return YES;
    }
    if (currentHour == openingHour && currentMinute > openingMinute) {
        return YES;
    }
    if (currentHour == closingHour && currentHour < closingMinute) {
        return YES;
    }
    
    return NO;
}

@end
