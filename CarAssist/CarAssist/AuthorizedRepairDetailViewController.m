//
//  AuthorizedRepairDetailViewController.m
//  CarAssist
//
//  Created by Dennis on 25.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairDetailViewController.h"
#import "Utils.h"

@interface AuthorizedRepairDetailViewController () <UITableViewDataSource, UITableViewDelegate>
- (void) setupMapView:(MKMapView *)mapView withShop:(AuthorizedRepair *) shop;
@property (nonatomic) AuthorizedRepair *shop;
@end

@implementation AuthorizedRepairDetailViewController

- (id)initWithAuthorizedRepair:(AuthorizedRepair *) shop
{
    self = [super init];
    if (self) {
        self.shop = shop;
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
    
    MKCoordinateRegion region = MKCoordinateRegionMake(shop.location, span);
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
    point.coordinate = shop.location;
    
    [mapView addAnnotation:point];
    [mapView selectAnnotation:point animated:NO];
    
    mapView.scrollEnabled = NO;
    mapView.zoomEnabled = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1; // Karte
        case 1:
            return 2; // Telefon, Route berechnen
        default:
            return 0;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"default"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"default"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

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
    if(indexPath.section == 1 && indexPath.row == 0) // Telefon-Zelle :)
    {
        NSMutableString *phoneUrl = [[NSMutableString alloc] initWithString:@"tel:"];
        [phoneUrl appendString:self.shop.phone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
    }
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
