//
//  AuthorizedRepairDetailViewController.m
//  CarAssist
//
//  Created by Dennis on 25.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairDetailViewController.h"
#import "Utils.h"

@interface AuthorizedRepairDetailViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>
- (void) setupMapView:(MKMapView *)mapView withShop:(AuthorizedRepair *) shop;
@property (nonatomic) AuthorizedRepair *shop;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) NSArray *weekdays;
@end

@implementation AuthorizedRepairDetailViewController

- (id)initWithAuthorizedRepair:(AuthorizedRepair *) shop
{
    self = [super init];
    if (self) {
        self.shop = shop;
        self.weekdays = [NSArray arrayWithObjects:
                         @"Montag",
                         @"Dienstag",
                         @"Mittwoch",
                         @"Donnerstag",
                         @"Freitag",
                         @"Samstag",
                         @"Sonntag",
                         nil];
        if(self.locationManager == Nil)
        {
            CLLocationManager *manager = [[CLLocationManager alloc] init];

            manager.delegate = self;
            manager.distanceFilter = kCLDistanceFilterNone;
            manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
            
            self.locationManager = manager;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Filiale";
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
}

- (void) setupMapView:(MKMapView *)mapView withShop:(AuthorizedRepair *) shop
{
    // Kartenposition und sichtbaren Bereich setzen
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    MKCoordinateRegion region = MKCoordinateRegionMake(shop.location.coordinate, span);
    mapView.region = region;
    
    // Marker auf der Karte
    NSMutableString *address =[[NSMutableString alloc] init];
    [address appendString:shop.street];
    [address appendString:@", "];
    [address appendString:shop.postalcode];
    [address appendString:@" "];
    [address appendString:shop.city];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.title = shop.name;
    point.subtitle = address;
    point.coordinate = shop.location.coordinate;
    
    [mapView addAnnotation:point];
    [mapView selectAnnotation:point animated:NO];
    
    mapView.scrollEnabled = NO;
    mapView.zoomEnabled = NO;
    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    [manager stopUpdatingLocation];
    CLLocation *loc = [locations lastObject];

    NSString *mapsUrl = [NSString stringWithFormat: @"http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f",
                         loc.coordinate.latitude,
                         loc.coordinate.longitude,
                         self.shop.location.coordinate.latitude,
                         self.shop.location.coordinate.longitude];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mapsUrl]];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1; // Karte
        case 1:
            return 2; // Telefon, Route berechnen
        case 2:
            return 7; // Öffnungszeiten, Jeder Wochentag ein Eintrag
        default:
            return 0;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"default"];
    

    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"default"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;


    if(indexPath.section == 0)
    {
        // Karte
        MKMapView *mv = [[MKMapView alloc] initWithFrame:CGRectMake(15, 5, 290, 200)];
        [self setupMapView:mv withShop:self.shop];
        cell.backgroundColor = [UIColor blackColor];
        [cell addSubview:mv];
    }
    
    if (indexPath.section == 1)
    {
        if(indexPath.row == 0)
        {
            cell.textLabel.text = @"Rufnummer";
            cell.detailTextLabel.text = self.shop.phone;
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel.text = @"Route berechnen";
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        }
 
    }
    
    if(indexPath.section == 2)
    {
        cell.detailTextLabel.text = [self.shop.hours objectAtIndex:indexPath.row];
        cell.textLabel.text = [self.weekdays objectAtIndex: indexPath.row];
    }
    
    
    return cell;
}
- (CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath
{
    if(indexPath.section == 0) {
        return 210;
    }
    
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1)
    {
        if(indexPath.row == 0)
        {
            // Telefon-Zelle getoucht :)
            
            // Sonderzeichen in der Telefonnummer filtern
            NSError *err;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\D+" options:0 error:&err];
            NSString *phonenumber = [regex stringByReplacingMatchesInString:self.shop.phone options:0 range:NSMakeRange(0, [self.shop.phone length]) withTemplate:@""];
            
            NSMutableString *phone = [[NSMutableString alloc] initWithString:@"tel:"];
            [phone appendString:phonenumber];
            
            NSURL *phoneUrl = [NSURL URLWithString:phone];
            
            if ([[UIApplication sharedApplication] canOpenURL:phoneUrl])
            {
                
                [[UIApplication sharedApplication] openURL:phoneUrl];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Telefon" message:@"Bitte erlauben Sie den Zugriff auf ihr Telefon." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];
            }
            

        } else if(indexPath.row == 1)
        {
            // Route berechnen getoucht
            if(![CLLocationManager locationServicesEnabled])
            {
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hinweis" message:@"Bitte aktivieren Sie den Ortungsdienst Telefoneinstellungen." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [message show];
            } else {
                [self.locationManager startUpdatingLocation];            
            }
        }
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section) {
        case 2:
            sectionName = @"Öffnungszeiten";
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
}
*/

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    [self.navigationController popToViewController:self animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
